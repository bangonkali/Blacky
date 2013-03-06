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
        SerialPortManager _spManager;
        public MainForm()
        {
            InitializeComponent();

            UserInitialization();
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

			portNameComboBox.SelectedIndex = portNameComboBox.Items.Count - 1;
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

            int maxTextLength = 1000; // maximum text length in text box
            if (tbData.TextLength > maxTextLength)
                tbData.Text = tbData.Text.Remove(0, tbData.TextLength - maxTextLength);

            // This application is connected to a GPS sending ASCCI characters, so data is converted to text
            string str = Encoding.ASCII.GetString(e.Data);
			string strfinal = "";

			byte[] ascii = Encoding.ASCII.GetBytes(str);

			foreach (byte b in ascii)
			{
				j.Add(b);
				tbData.AppendText(b.ToString() + " ");
				if (FindDataFromBuffer(j, 28, 13) == 1)
				{
					j.Clear();
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

		private void MainForm_Load(object sender, EventArgs e)
		{

		}


		int FindDataFromBuffer(List<byte> buffer, short buffer_length, short data_length)
		{
			int i=0;
			tBufferLength.Text = j.Count.ToString();

			if (j.Count > buffer_length)
			{
				for (i = 0; i < buffer_length - data_length; i++)
				{
					if (
						buffer[0 + i] == 1 &&
						buffer[2 + i] == 2 &&
						buffer[4 + i] == 3 &&
						buffer[6 + i] == 4 &&
						buffer[10 + i] == 5 &&
						buffer[12 + i] == 6
						)
					{
						tbData.Clear();
						tbData.AppendText("Left Sensor: " + buffer[1 + i] + "\r\n");
						tbData.AppendText("Right Sensor: " + buffer[3 + i] + "\r\n");
						tbData.AppendText("Front Sensor: " + buffer[5 + i] + "\r\n");

						string  compass_reading = System.Text.Encoding.ASCII.GetString(buffer.ToArray<byte>(), 7+i,3);

						tbData.AppendText("Compass: " + compass_reading + "\r\n");
						tbData.AppendText("Start: " + buffer[11 + i] + "\r\n");

						tLeft.Text = ((int)buffer[1 + i]).ToString();
						tRight.Text = ((int)buffer[3 + i]).ToString();
						tFront.Text = ((int)buffer[5 + i]).ToString();

						int compass_reading_int = 0;
						if (int.TryParse(compass_reading, out compass_reading_int))
						{
							compass.Value = compass_reading_int;
							compass.NeedleColor1 = AGaugeNeedleColor.Gray;
						}
						else
						{
							compass.NeedleColor1 = AGaugeNeedleColor.Red;
						}

						
						tbData.ScrollToCaret();

						buffer.Clear();

						return 1;
					}

				}

				if (j.Count > buffer_length)
				{
					buffer.Clear();
					return 1;
				}
			}

			return 0;
		}

		private void tFront_TextChanged(object sender, EventArgs e)
		{

		}

    }
}
