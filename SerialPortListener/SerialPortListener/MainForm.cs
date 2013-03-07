using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SerialPortListener.Serial;
using System.IO;

namespace SerialPortListener
{
    public partial class MainForm : Form
    {
		bool something_new = false;

		byte returnvalue = 0xFF;
        SerialPortManager _spManager;
        public MainForm()
        {
            InitializeComponent();

            UserInitialization();
        }

		public class RunMotorConfiguration
		{
			public int Value;
			public string Name;

			public RunMotorConfiguration(int value, string name)
			{
				this.Value = value;
				this.Name = name;
			}

			public override string ToString()
			{
				return this.Name;
			}
		}
      
        private void UserInitialization()
        {
            _spManager = new SerialPortManager();
            SerialSettings mySerialSettings = _spManager.CurrentSerialSettings;
            serialSettingsBindingSource.DataSource = mySerialSettings;
            portNameComboBox.DataSource = mySerialSettings.PortNameCollection;
            baudRateComboBox.DataSource = mySerialSettings.BaudRateCollection;
            dataBitsComboBox.DataSource = mySerialSettings.DataBitsCollection;
            parityComboBox.DataSource = Enum.GetValues(typeof(System.IO.Ports.Parity));
            stopBitsComboBox.DataSource = Enum.GetValues(typeof(System.IO.Ports.StopBits));

            _spManager.NewSerialDataRecieved += new EventHandler<SerialDataEventArgs>(_spManager_NewSerialDataRecieved);
            this.FormClosing += new FormClosingEventHandler(MainForm_FormClosing);


			cboType.Items.Add(new RunMotorConfiguration(1, "Fast - Sparce Compass"));
			cboType.Items.Add(new RunMotorConfiguration(2, "Fast - Constant Compass"));
			cboType.Items.Add(new RunMotorConfiguration(3, "Slow - Sparce Compass"));
			cboType.Items.Add(new RunMotorConfiguration(4, "Slow - Constant Compass"));
			cboType.Items.Add(new RunMotorConfiguration(5, "Fast - No Compass"));
			cboType.Items.Add(new RunMotorConfiguration(6, "Slow - No Compass"));
        }

        
        private void MainForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            _spManager.Dispose();   
        }

		List<byte> j = new List<byte>();

        void _spManager_NewSerialDataRecieved(object sender, SerialDataEventArgs e)
        {
            if (this.InvokeRequired)
            {
                // Using this.Invoke causes deadlock when closing serial port, and BeginInvoke is good practice anyway.
                this.BeginInvoke(new EventHandler<SerialDataEventArgs>(_spManager_NewSerialDataRecieved), new object[] { sender, e });
                return;
            }

			something_new = true;
            int maxTextLength = 1000; // maximum text length in text box
            if (tbData.TextLength > maxTextLength)
                tbData.Text = tbData.Text.Remove(0, tbData.TextLength - maxTextLength);

            // This application is connected to a GPS sending ASCCI characters, so data is converted to text
            string str = Encoding.ASCII.GetString(e.Data);

			byte[] ascii = Encoding.ASCII.GetBytes(str);

			foreach (byte b in ascii)
			{
				j.Add(b);

				if (j.Count >= 3)
				{
					if (j.ToArray<Byte>()[j.Count - 1] == 0x14 &&
						j.ToArray<Byte>()[j.Count - 1] == 0x13 &&
						j.ToArray<Byte>()[j.Count - 1] == 0x12)
					{
						//byte[] k = { returnvalue };
						//_spManager.Write(k,0,1);
						//System.Diagnostics.Debug.WriteLine("Writing " + (int)returnvalue);
						//_spManager.StartListening();
					}
				}

				tbData.AppendText(b.ToString() + " ");
				if (FindDataFromBuffer(j.ToList<Byte>(), 42, 19) == 1)
				{
				}
			}
        }

        // Handles the "Start Listening"-buttom click event
        private void btnStart_Click(object sender, EventArgs e)
        {
            _spManager.StartListening();
        }

        // Handles the "Stop Listening"-buttom click event
        private void btnStop_Click(object sender, EventArgs e)
        {
			_spManager.StopListening();
        }


		int FindDataFromBuffer(List<byte> buffer, short buffer_length, short data_length)
		{
			int i=0;
			tBufferLength.Text = j.Count.ToString();

			while (j.Count > buffer_length*2)
			{
				j.Clear();
				//j.RemoveAt(0);
			}



			if (j.Count > buffer_length)
			{
				for (i = 0; i < buffer_length - data_length; i++)
				{
					if (
						j[0 + i] == 1 &&
						j[2 + i] == 2 &&
						j[4 + i] == 3 &&
						j[6 + i] == 4 &&
						j[10 + i] == 5 &&
						j[12 + i] == 6
						)
					{
						tbData.Clear();
						tbData.AppendText("Left Sensor: " + j[1 + i] + "\r\n");
						tbData.AppendText("Right Sensor: " + j[3 + i] + "\r\n");
						tbData.AppendText("Front Sensor: " + j[5 + i] + "\r\n");

						string  compass_reading = System.Text.Encoding.ASCII.GetString(j.ToArray<byte>(), 7+i,3);
						string compass_reading_i = System.Text.Encoding.ASCII.GetString(j.ToArray<byte>(), 13 + i, 3);

						tbData.AppendText("Compass: " + compass_reading + "\r\n");
						tbData.AppendText("Compass Initial: " + compass_reading_i + "\r\n");
						tbData.AppendText("Start: " + j[11 + i] + "\r\n");

						tLeft.Text = ((int)j[1 + i]).ToString();
						tRight.Text = ((int)j[3 + i]).ToString();
						tFront.Text = ((int)j[5 + i]).ToString();

						int compass_reading_int = 0;
						if (int.TryParse(compass_reading, out compass_reading_int))
						{
							compass.Value = compass_reading_int;
							compass.NeedleColor1 = AGaugeNeedleColor.Gray;
						}
						else
						{
							compass.Value = compass_reading_int;
							compass.NeedleColor1 = AGaugeNeedleColor.Red;
						}



						int compass_initial_int = 0;
						if (int.TryParse(compass_reading_i, out compass_initial_int))
						{
							compass_initial.Value = compass_initial_int;
							compass_initial.NeedleColor1 = AGaugeNeedleColor.Gray;
						}
						else
						{
							compass_initial.Value = compass_initial_int;
							compass_initial.NeedleColor1 = AGaugeNeedleColor.Red;
						}
						System.Diagnostics.Debug.WriteLine("Initial Dircetion: " + compass_initial_int.ToString());

						tbData.ScrollToCaret();

						aGauge1.Value = (int)j[16 + i];
						aGauge2.Value = (int)j[17 + i];


						System.Diagnostics.Debug.WriteLine("1: " + (int)j[16 + i] + "; 2: " + (int)j[17 + i]);

						j.Clear();
						j.Clear();

						return 1;
					}

				}

				if (j.Count > buffer_length)
				{
					j.Clear();
					return 1;
				}
			}

			return 0;
		}

		private void btnMotor_Click(object sender, EventArgs e)
		{
			ForceSend();
		}

		private void ForceSend()
		{
			if (cboType.SelectedItem != null)
			{
				RunMotorConfiguration config = (RunMotorConfiguration)cboType.SelectedItem;

				returnvalue = (byte)config.Value;
				byte[] k = { returnvalue };
				_spManager.Write(k, 0, 1);
				System.Diagnostics.Debug.WriteLine("Writing " + (uint)returnvalue);
				_spManager.StartListening();
			}
		}

		private void MainForm_Load(object sender, EventArgs e)
		{

		}

		private void MainForm_Shown(object sender, EventArgs e)
		{
			portNameComboBox.SelectedIndex = portNameComboBox.Items.Count - 1;
		}

    }
}
