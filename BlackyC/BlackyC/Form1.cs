using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace BlackyC
{
	public partial class frmMain : Form
	{
		string buffer = "";

		public frmMain()
		{

			InitializeComponent();

		}

		private void btnConnect_Click(object sender, EventArgs e)
		{
		}

		private void txtRight_TextChanged(object sender, EventArgs e)
		{

		}

		private void frmMain_Load(object sender, EventArgs e)
		{
			serialPort.PortName = "COM" + txtPort.Text;

		}

		private void serialPort_DataReceived(object sender, System.IO.Ports.SerialDataReceivedEventArgs e)
		{
			buffer = serialPort.ReadExisting();
			txtLog.Text = buffer;
			buffer = "";
		}
	}
}
