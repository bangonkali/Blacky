namespace BlackyC
{
	partial class frmMain
	{
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing && (components != null))
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Windows Form Designer generated code

		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.components = new System.ComponentModel.Container();
			System.Windows.Forms.AGaugeRange aGaugeRange2 = new System.Windows.Forms.AGaugeRange();
			this.serialPort = new System.IO.Ports.SerialPort(this.components);
			this.label1 = new System.Windows.Forms.Label();
			this.txtPort = new System.Windows.Forms.TextBox();
			this.btnConnect = new System.Windows.Forms.Button();
			this.compass = new System.Windows.Forms.AGauge();
			this.label2 = new System.Windows.Forms.Label();
			this.txtFront = new System.Windows.Forms.TextBox();
			this.txtRight = new System.Windows.Forms.TextBox();
			this.label3 = new System.Windows.Forms.Label();
			this.txtLeft = new System.Windows.Forms.TextBox();
			this.label4 = new System.Windows.Forms.Label();
			this.btnStart = new System.Windows.Forms.Button();
			this.button1 = new System.Windows.Forms.Button();
			this.btnClose = new System.Windows.Forms.Button();
			this.txtLog = new System.Windows.Forms.TextBox();
			this.SuspendLayout();
			// 
			// serialPort
			// 
			this.serialPort.PortName = "COM3";
			this.serialPort.ReadBufferSize = 1024;
			this.serialPort.DataReceived += new System.IO.Ports.SerialDataReceivedEventHandler(this.serialPort_DataReceived);
			// 
			// label1
			// 
			this.label1.AutoSize = true;
			this.label1.Location = new System.Drawing.Point(18, 15);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(40, 13);
			this.label1.TabIndex = 0;
			this.label1.Text = "PORT:";
			// 
			// txtPort
			// 
			this.txtPort.Location = new System.Drawing.Point(92, 12);
			this.txtPort.Name = "txtPort";
			this.txtPort.Size = new System.Drawing.Size(87, 20);
			this.txtPort.TabIndex = 1;
			this.txtPort.Text = "3";
			// 
			// btnConnect
			// 
			this.btnConnect.Location = new System.Drawing.Point(185, 10);
			this.btnConnect.Name = "btnConnect";
			this.btnConnect.Size = new System.Drawing.Size(75, 23);
			this.btnConnect.TabIndex = 2;
			this.btnConnect.Text = "&Connect";
			this.btnConnect.UseVisualStyleBackColor = true;
			this.btnConnect.Click += new System.EventHandler(this.btnConnect_Click);
			// 
			// compass
			// 
			this.compass.BaseArcColor = System.Drawing.Color.Gray;
			this.compass.BaseArcRadius = 80;
			this.compass.BaseArcStart = 270;
			this.compass.BaseArcSweep = 360;
			this.compass.BaseArcWidth = 2;
			this.compass.Center = new System.Drawing.Point(100, 100);
			aGaugeRange2.Color = System.Drawing.Color.Red;
			aGaugeRange2.EndValue = 90F;
			aGaugeRange2.InnerRadius = 1;
			aGaugeRange2.InRange = false;
			aGaugeRange2.Name = "GaugeRange1";
			aGaugeRange2.OuterRadius = 2;
			aGaugeRange2.StartValue = 0F;
			this.compass.GaugeRanges.Add(aGaugeRange2);
			this.compass.Location = new System.Drawing.Point(21, 52);
			this.compass.MaxValue = 360F;
			this.compass.MinValue = 0F;
			this.compass.Name = "compass";
			this.compass.NeedleColor1 = System.Windows.Forms.AGaugeNeedleColor.Gray;
			this.compass.NeedleColor2 = System.Drawing.Color.DimGray;
			this.compass.NeedleRadius = 80;
			this.compass.NeedleType = System.Windows.Forms.NeedleType.Advance;
			this.compass.NeedleWidth = 2;
			this.compass.ScaleLinesInterColor = System.Drawing.Color.Black;
			this.compass.ScaleLinesInterInnerRadius = 73;
			this.compass.ScaleLinesInterOuterRadius = 80;
			this.compass.ScaleLinesInterWidth = 1;
			this.compass.ScaleLinesMajorColor = System.Drawing.Color.Black;
			this.compass.ScaleLinesMajorInnerRadius = 70;
			this.compass.ScaleLinesMajorOuterRadius = 80;
			this.compass.ScaleLinesMajorStepValue = 45F;
			this.compass.ScaleLinesMajorWidth = 2;
			this.compass.ScaleLinesMinorColor = System.Drawing.Color.Gray;
			this.compass.ScaleLinesMinorInnerRadius = 75;
			this.compass.ScaleLinesMinorOuterRadius = 80;
			this.compass.ScaleLinesMinorTicks = 9;
			this.compass.ScaleLinesMinorWidth = 1;
			this.compass.ScaleNumbersColor = System.Drawing.Color.Black;
			this.compass.ScaleNumbersFormat = null;
			this.compass.ScaleNumbersRadius = 95;
			this.compass.ScaleNumbersRotation = 0;
			this.compass.ScaleNumbersStartScaleLine = 0;
			this.compass.ScaleNumbersStepScaleLines = 1;
			this.compass.Size = new System.Drawing.Size(248, 214);
			this.compass.TabIndex = 3;
			this.compass.Text = "aGauge1";
			this.compass.Value = 0F;
			// 
			// label2
			// 
			this.label2.AutoSize = true;
			this.label2.Location = new System.Drawing.Point(324, 52);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(70, 13);
			this.label2.TabIndex = 4;
			this.label2.Text = "Front Sensor:";
			// 
			// txtFront
			// 
			this.txtFront.Location = new System.Drawing.Point(338, 68);
			this.txtFront.Name = "txtFront";
			this.txtFront.Size = new System.Drawing.Size(43, 20);
			this.txtFront.TabIndex = 5;
			// 
			// txtRight
			// 
			this.txtRight.Location = new System.Drawing.Point(403, 94);
			this.txtRight.Name = "txtRight";
			this.txtRight.Size = new System.Drawing.Size(43, 20);
			this.txtRight.TabIndex = 7;
			this.txtRight.TextChanged += new System.EventHandler(this.txtRight_TextChanged);
			// 
			// label3
			// 
			this.label3.AutoSize = true;
			this.label3.Location = new System.Drawing.Point(265, 117);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(71, 13);
			this.label3.TabIndex = 6;
			this.label3.Text = "Right Sensor:";
			// 
			// txtLeft
			// 
			this.txtLeft.Location = new System.Drawing.Point(281, 94);
			this.txtLeft.Name = "txtLeft";
			this.txtLeft.Size = new System.Drawing.Size(43, 20);
			this.txtLeft.TabIndex = 9;
			// 
			// label4
			// 
			this.label4.AutoSize = true;
			this.label4.Location = new System.Drawing.Point(394, 117);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(64, 13);
			this.label4.TabIndex = 8;
			this.label4.Text = "Left Sensor:";
			// 
			// btnStart
			// 
			this.btnStart.Location = new System.Drawing.Point(268, 214);
			this.btnStart.Name = "btnStart";
			this.btnStart.Size = new System.Drawing.Size(100, 23);
			this.btnStart.TabIndex = 10;
			this.btnStart.Text = "&Start";
			this.btnStart.UseVisualStyleBackColor = true;
			// 
			// button1
			// 
			this.button1.Location = new System.Drawing.Point(268, 243);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(100, 23);
			this.button1.TabIndex = 11;
			this.button1.Text = "S&top";
			this.button1.UseVisualStyleBackColor = true;
			// 
			// btnClose
			// 
			this.btnClose.Location = new System.Drawing.Point(383, 243);
			this.btnClose.Name = "btnClose";
			this.btnClose.Size = new System.Drawing.Size(75, 23);
			this.btnClose.TabIndex = 12;
			this.btnClose.Text = "&Close";
			this.btnClose.UseVisualStyleBackColor = true;
			// 
			// txtLog
			// 
			this.txtLog.Location = new System.Drawing.Point(21, 290);
			this.txtLog.Multiline = true;
			this.txtLog.Name = "txtLog";
			this.txtLog.Size = new System.Drawing.Size(441, 148);
			this.txtLog.TabIndex = 13;
			// 
			// frmMain
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(474, 450);
			this.Controls.Add(this.txtLog);
			this.Controls.Add(this.btnClose);
			this.Controls.Add(this.button1);
			this.Controls.Add(this.btnStart);
			this.Controls.Add(this.txtLeft);
			this.Controls.Add(this.label4);
			this.Controls.Add(this.txtRight);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.txtFront);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.compass);
			this.Controls.Add(this.btnConnect);
			this.Controls.Add(this.txtPort);
			this.Controls.Add(this.label1);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
			this.Name = "frmMain";
			this.Text = "Blacky C# Client";
			this.Load += new System.EventHandler(this.frmMain_Load);
			this.ResumeLayout(false);
			this.PerformLayout();

		}

		#endregion

		private System.IO.Ports.SerialPort serialPort;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.TextBox txtPort;
		private System.Windows.Forms.Button btnConnect;
		private System.Windows.Forms.AGauge compass;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.TextBox txtFront;
		private System.Windows.Forms.TextBox txtRight;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.TextBox txtLeft;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Button btnStart;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Button btnClose;
		private System.Windows.Forms.TextBox txtLog;
	}
}

