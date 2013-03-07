namespace SerialPortListener
{
    partial class MainForm
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
			System.Windows.Forms.Label baudRateLabel;
			System.Windows.Forms.Label dataBitsLabel;
			System.Windows.Forms.Label parityLabel;
			System.Windows.Forms.Label portNameLabel;
			System.Windows.Forms.Label stopBitsLabel;
			System.Windows.Forms.Label label1;
			System.Windows.Forms.Label label2;
			this.baudRateComboBox = new System.Windows.Forms.ComboBox();
			this.dataBitsComboBox = new System.Windows.Forms.ComboBox();
			this.parityComboBox = new System.Windows.Forms.ComboBox();
			this.portNameComboBox = new System.Windows.Forms.ComboBox();
			this.stopBitsComboBox = new System.Windows.Forms.ComboBox();
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.btnStart = new System.Windows.Forms.Button();
			this.tbData = new System.Windows.Forms.TextBox();
			this.btnStop = new System.Windows.Forms.Button();
			this.compass = new System.Windows.Forms.AGauge();
			this.tFront = new System.Windows.Forms.TextBox();
			this.tLeft = new System.Windows.Forms.TextBox();
			this.tRight = new System.Windows.Forms.TextBox();
			this.tBufferLength = new System.Windows.Forms.TextBox();
			this.btnMotor = new System.Windows.Forms.Button();
			this.compass_initial = new System.Windows.Forms.AGauge();
			this.aGauge1 = new System.Windows.Forms.AGauge();
			this.aGauge2 = new System.Windows.Forms.AGauge();
			this.cboType = new System.Windows.Forms.ComboBox();
			this.serialSettingsBindingSource = new System.Windows.Forms.BindingSource(this.components);
			baudRateLabel = new System.Windows.Forms.Label();
			dataBitsLabel = new System.Windows.Forms.Label();
			parityLabel = new System.Windows.Forms.Label();
			portNameLabel = new System.Windows.Forms.Label();
			stopBitsLabel = new System.Windows.Forms.Label();
			label1 = new System.Windows.Forms.Label();
			label2 = new System.Windows.Forms.Label();
			this.groupBox1.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.serialSettingsBindingSource)).BeginInit();
			this.SuspendLayout();
			// 
			// baudRateLabel
			// 
			baudRateLabel.AutoSize = true;
			baudRateLabel.Location = new System.Drawing.Point(10, 59);
			baudRateLabel.Name = "baudRateLabel";
			baudRateLabel.Size = new System.Drawing.Size(61, 13);
			baudRateLabel.TabIndex = 1;
			baudRateLabel.Text = "Baud Rate:";
			// 
			// dataBitsLabel
			// 
			dataBitsLabel.AutoSize = true;
			dataBitsLabel.Location = new System.Drawing.Point(10, 86);
			dataBitsLabel.Name = "dataBitsLabel";
			dataBitsLabel.Size = new System.Drawing.Size(53, 13);
			dataBitsLabel.TabIndex = 3;
			dataBitsLabel.Text = "Data Bits:";
			// 
			// parityLabel
			// 
			parityLabel.AutoSize = true;
			parityLabel.Location = new System.Drawing.Point(10, 113);
			parityLabel.Name = "parityLabel";
			parityLabel.Size = new System.Drawing.Size(36, 13);
			parityLabel.TabIndex = 5;
			parityLabel.Text = "Parity:";
			// 
			// portNameLabel
			// 
			portNameLabel.AutoSize = true;
			portNameLabel.Location = new System.Drawing.Point(10, 32);
			portNameLabel.Name = "portNameLabel";
			portNameLabel.Size = new System.Drawing.Size(60, 13);
			portNameLabel.TabIndex = 7;
			portNameLabel.Text = "Port Name:";
			// 
			// stopBitsLabel
			// 
			stopBitsLabel.AutoSize = true;
			stopBitsLabel.Location = new System.Drawing.Point(10, 140);
			stopBitsLabel.Name = "stopBitsLabel";
			stopBitsLabel.Size = new System.Drawing.Size(52, 13);
			stopBitsLabel.TabIndex = 9;
			stopBitsLabel.Text = "Stop Bits:";
			// 
			// baudRateComboBox
			// 
			this.baudRateComboBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.serialSettingsBindingSource, "BaudRate", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
			this.baudRateComboBox.FormattingEnabled = true;
			this.baudRateComboBox.Location = new System.Drawing.Point(77, 56);
			this.baudRateComboBox.Name = "baudRateComboBox";
			this.baudRateComboBox.Size = new System.Drawing.Size(91, 21);
			this.baudRateComboBox.TabIndex = 2;
			// 
			// dataBitsComboBox
			// 
			this.dataBitsComboBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.serialSettingsBindingSource, "DataBits", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
			this.dataBitsComboBox.FormattingEnabled = true;
			this.dataBitsComboBox.Location = new System.Drawing.Point(77, 83);
			this.dataBitsComboBox.Name = "dataBitsComboBox";
			this.dataBitsComboBox.Size = new System.Drawing.Size(91, 21);
			this.dataBitsComboBox.TabIndex = 4;
			// 
			// parityComboBox
			// 
			this.parityComboBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.serialSettingsBindingSource, "Parity", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
			this.parityComboBox.FormattingEnabled = true;
			this.parityComboBox.Location = new System.Drawing.Point(77, 110);
			this.parityComboBox.Name = "parityComboBox";
			this.parityComboBox.Size = new System.Drawing.Size(91, 21);
			this.parityComboBox.TabIndex = 6;
			// 
			// portNameComboBox
			// 
			this.portNameComboBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.serialSettingsBindingSource, "PortName", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
			this.portNameComboBox.FormattingEnabled = true;
			this.portNameComboBox.Location = new System.Drawing.Point(77, 29);
			this.portNameComboBox.Name = "portNameComboBox";
			this.portNameComboBox.Size = new System.Drawing.Size(91, 21);
			this.portNameComboBox.TabIndex = 8;
			// 
			// stopBitsComboBox
			// 
			this.stopBitsComboBox.DataBindings.Add(new System.Windows.Forms.Binding("Text", this.serialSettingsBindingSource, "StopBits", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
			this.stopBitsComboBox.FormattingEnabled = true;
			this.stopBitsComboBox.Location = new System.Drawing.Point(77, 137);
			this.stopBitsComboBox.Name = "stopBitsComboBox";
			this.stopBitsComboBox.Size = new System.Drawing.Size(91, 21);
			this.stopBitsComboBox.TabIndex = 10;
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.Add(this.cboType);
			this.groupBox1.Controls.Add(label2);
			this.groupBox1.Controls.Add(this.baudRateComboBox);
			this.groupBox1.Controls.Add(baudRateLabel);
			this.groupBox1.Controls.Add(this.stopBitsComboBox);
			this.groupBox1.Controls.Add(stopBitsLabel);
			this.groupBox1.Controls.Add(dataBitsLabel);
			this.groupBox1.Controls.Add(this.portNameComboBox);
			this.groupBox1.Controls.Add(this.dataBitsComboBox);
			this.groupBox1.Controls.Add(portNameLabel);
			this.groupBox1.Controls.Add(parityLabel);
			this.groupBox1.Controls.Add(this.parityComboBox);
			this.groupBox1.Location = new System.Drawing.Point(12, 12);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(347, 171);
			this.groupBox1.TabIndex = 11;
			this.groupBox1.TabStop = false;
			this.groupBox1.Text = "Serial Port Settings";
			// 
			// btnStart
			// 
			this.btnStart.Location = new System.Drawing.Point(12, 189);
			this.btnStart.Name = "btnStart";
			this.btnStart.Size = new System.Drawing.Size(85, 23);
			this.btnStart.TabIndex = 12;
			this.btnStart.Text = "Start listening";
			this.btnStart.UseVisualStyleBackColor = true;
			this.btnStart.Click += new System.EventHandler(this.btnStart_Click);
			// 
			// tbData
			// 
			this.tbData.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
			this.tbData.Location = new System.Drawing.Point(12, 218);
			this.tbData.Multiline = true;
			this.tbData.Name = "tbData";
			this.tbData.ReadOnly = true;
			this.tbData.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
			this.tbData.Size = new System.Drawing.Size(347, 294);
			this.tbData.TabIndex = 13;
			// 
			// btnStop
			// 
			this.btnStop.Location = new System.Drawing.Point(103, 189);
			this.btnStop.Name = "btnStop";
			this.btnStop.Size = new System.Drawing.Size(85, 23);
			this.btnStop.TabIndex = 12;
			this.btnStop.Text = "Stop listening";
			this.btnStop.UseVisualStyleBackColor = true;
			this.btnStop.Click += new System.EventHandler(this.btnStop_Click);
			// 
			// compass
			// 
			this.compass.BaseArcColor = System.Drawing.Color.Gray;
			this.compass.BaseArcRadius = 80;
			this.compass.BaseArcStart = 270;
			this.compass.BaseArcSweep = 360;
			this.compass.BaseArcWidth = 2;
			this.compass.Center = new System.Drawing.Point(120, 100);
			this.compass.Location = new System.Drawing.Point(365, 44);
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
			this.compass.Size = new System.Drawing.Size(246, 200);
			this.compass.TabIndex = 14;
			this.compass.Text = "Compass";
			this.compass.Value = 0F;
			// 
			// tFront
			// 
			this.tFront.Location = new System.Drawing.Point(432, 12);
			this.tFront.Name = "tFront";
			this.tFront.ReadOnly = true;
			this.tFront.Size = new System.Drawing.Size(40, 20);
			this.tFront.TabIndex = 15;
			// 
			// tLeft
			// 
			this.tLeft.Location = new System.Drawing.Point(478, 12);
			this.tLeft.Name = "tLeft";
			this.tLeft.ReadOnly = true;
			this.tLeft.Size = new System.Drawing.Size(40, 20);
			this.tLeft.TabIndex = 16;
			// 
			// tRight
			// 
			this.tRight.Location = new System.Drawing.Point(386, 12);
			this.tRight.Name = "tRight";
			this.tRight.ReadOnly = true;
			this.tRight.Size = new System.Drawing.Size(40, 20);
			this.tRight.TabIndex = 17;
			// 
			// tBufferLength
			// 
			this.tBufferLength.Location = new System.Drawing.Point(792, 12);
			this.tBufferLength.Name = "tBufferLength";
			this.tBufferLength.ReadOnly = true;
			this.tBufferLength.Size = new System.Drawing.Size(61, 20);
			this.tBufferLength.TabIndex = 18;
			// 
			// btnMotor
			// 
			this.btnMotor.Location = new System.Drawing.Point(274, 189);
			this.btnMotor.Name = "btnMotor";
			this.btnMotor.Size = new System.Drawing.Size(85, 23);
			this.btnMotor.TabIndex = 19;
			this.btnMotor.Text = "&Start Motor";
			this.btnMotor.UseVisualStyleBackColor = true;
			this.btnMotor.Click += new System.EventHandler(this.btnMotor_Click);
			// 
			// compass_initial
			// 
			this.compass_initial.BaseArcColor = System.Drawing.Color.Gray;
			this.compass_initial.BaseArcRadius = 80;
			this.compass_initial.BaseArcStart = 270;
			this.compass_initial.BaseArcSweep = 360;
			this.compass_initial.BaseArcWidth = 2;
			this.compass_initial.Center = new System.Drawing.Point(120, 100);
			this.compass_initial.Location = new System.Drawing.Point(607, 44);
			this.compass_initial.MaxValue = 360F;
			this.compass_initial.MinValue = 0F;
			this.compass_initial.Name = "compass_initial";
			this.compass_initial.NeedleColor1 = System.Windows.Forms.AGaugeNeedleColor.Gray;
			this.compass_initial.NeedleColor2 = System.Drawing.Color.DimGray;
			this.compass_initial.NeedleRadius = 80;
			this.compass_initial.NeedleType = System.Windows.Forms.NeedleType.Advance;
			this.compass_initial.NeedleWidth = 2;
			this.compass_initial.ScaleLinesInterColor = System.Drawing.Color.Black;
			this.compass_initial.ScaleLinesInterInnerRadius = 73;
			this.compass_initial.ScaleLinesInterOuterRadius = 80;
			this.compass_initial.ScaleLinesInterWidth = 1;
			this.compass_initial.ScaleLinesMajorColor = System.Drawing.Color.Black;
			this.compass_initial.ScaleLinesMajorInnerRadius = 70;
			this.compass_initial.ScaleLinesMajorOuterRadius = 80;
			this.compass_initial.ScaleLinesMajorStepValue = 45F;
			this.compass_initial.ScaleLinesMajorWidth = 2;
			this.compass_initial.ScaleLinesMinorColor = System.Drawing.Color.Gray;
			this.compass_initial.ScaleLinesMinorInnerRadius = 75;
			this.compass_initial.ScaleLinesMinorOuterRadius = 80;
			this.compass_initial.ScaleLinesMinorTicks = 9;
			this.compass_initial.ScaleLinesMinorWidth = 1;
			this.compass_initial.ScaleNumbersColor = System.Drawing.Color.Black;
			this.compass_initial.ScaleNumbersFormat = null;
			this.compass_initial.ScaleNumbersRadius = 95;
			this.compass_initial.ScaleNumbersRotation = 0;
			this.compass_initial.ScaleNumbersStartScaleLine = 0;
			this.compass_initial.ScaleNumbersStepScaleLines = 1;
			this.compass_initial.Size = new System.Drawing.Size(246, 200);
			this.compass_initial.TabIndex = 21;
			this.compass_initial.Text = "Compass";
			this.compass_initial.Value = 0F;
			// 
			// aGauge1
			// 
			this.aGauge1.BaseArcColor = System.Drawing.Color.Gray;
			this.aGauge1.BaseArcRadius = 80;
			this.aGauge1.BaseArcStart = 270;
			this.aGauge1.BaseArcSweep = 360;
			this.aGauge1.BaseArcWidth = 2;
			this.aGauge1.Center = new System.Drawing.Point(120, 100);
			this.aGauge1.Location = new System.Drawing.Point(365, 312);
			this.aGauge1.MaxValue = 124F;
			this.aGauge1.MinValue = 0F;
			this.aGauge1.Name = "aGauge1";
			this.aGauge1.NeedleColor1 = System.Windows.Forms.AGaugeNeedleColor.Gray;
			this.aGauge1.NeedleColor2 = System.Drawing.Color.DimGray;
			this.aGauge1.NeedleRadius = 80;
			this.aGauge1.NeedleType = System.Windows.Forms.NeedleType.Advance;
			this.aGauge1.NeedleWidth = 2;
			this.aGauge1.ScaleLinesInterColor = System.Drawing.Color.Black;
			this.aGauge1.ScaleLinesInterInnerRadius = 73;
			this.aGauge1.ScaleLinesInterOuterRadius = 80;
			this.aGauge1.ScaleLinesInterWidth = 1;
			this.aGauge1.ScaleLinesMajorColor = System.Drawing.Color.Black;
			this.aGauge1.ScaleLinesMajorInnerRadius = 70;
			this.aGauge1.ScaleLinesMajorOuterRadius = 80;
			this.aGauge1.ScaleLinesMajorStepValue = 31F;
			this.aGauge1.ScaleLinesMajorWidth = 2;
			this.aGauge1.ScaleLinesMinorColor = System.Drawing.Color.Gray;
			this.aGauge1.ScaleLinesMinorInnerRadius = 75;
			this.aGauge1.ScaleLinesMinorOuterRadius = 80;
			this.aGauge1.ScaleLinesMinorTicks = 9;
			this.aGauge1.ScaleLinesMinorWidth = 1;
			this.aGauge1.ScaleNumbersColor = System.Drawing.Color.Black;
			this.aGauge1.ScaleNumbersFormat = null;
			this.aGauge1.ScaleNumbersRadius = 95;
			this.aGauge1.ScaleNumbersRotation = 0;
			this.aGauge1.ScaleNumbersStartScaleLine = 0;
			this.aGauge1.ScaleNumbersStepScaleLines = 1;
			this.aGauge1.Size = new System.Drawing.Size(246, 200);
			this.aGauge1.TabIndex = 22;
			this.aGauge1.Text = "Compass";
			this.aGauge1.Value = 0F;
			// 
			// aGauge2
			// 
			this.aGauge2.BaseArcColor = System.Drawing.Color.Gray;
			this.aGauge2.BaseArcRadius = 80;
			this.aGauge2.BaseArcStart = 270;
			this.aGauge2.BaseArcSweep = 360;
			this.aGauge2.BaseArcWidth = 2;
			this.aGauge2.Center = new System.Drawing.Point(120, 100);
			this.aGauge2.Location = new System.Drawing.Point(607, 312);
			this.aGauge2.MaxValue = 124F;
			this.aGauge2.MinValue = 0F;
			this.aGauge2.Name = "aGauge2";
			this.aGauge2.NeedleColor1 = System.Windows.Forms.AGaugeNeedleColor.Gray;
			this.aGauge2.NeedleColor2 = System.Drawing.Color.DimGray;
			this.aGauge2.NeedleRadius = 80;
			this.aGauge2.NeedleType = System.Windows.Forms.NeedleType.Advance;
			this.aGauge2.NeedleWidth = 2;
			this.aGauge2.ScaleLinesInterColor = System.Drawing.Color.Black;
			this.aGauge2.ScaleLinesInterInnerRadius = 73;
			this.aGauge2.ScaleLinesInterOuterRadius = 80;
			this.aGauge2.ScaleLinesInterWidth = 1;
			this.aGauge2.ScaleLinesMajorColor = System.Drawing.Color.Black;
			this.aGauge2.ScaleLinesMajorInnerRadius = 70;
			this.aGauge2.ScaleLinesMajorOuterRadius = 80;
			this.aGauge2.ScaleLinesMajorStepValue = 31F;
			this.aGauge2.ScaleLinesMajorWidth = 2;
			this.aGauge2.ScaleLinesMinorColor = System.Drawing.Color.Gray;
			this.aGauge2.ScaleLinesMinorInnerRadius = 75;
			this.aGauge2.ScaleLinesMinorOuterRadius = 80;
			this.aGauge2.ScaleLinesMinorTicks = 9;
			this.aGauge2.ScaleLinesMinorWidth = 1;
			this.aGauge2.ScaleNumbersColor = System.Drawing.Color.Black;
			this.aGauge2.ScaleNumbersFormat = null;
			this.aGauge2.ScaleNumbersRadius = 95;
			this.aGauge2.ScaleNumbersRotation = 0;
			this.aGauge2.ScaleNumbersStartScaleLine = 0;
			this.aGauge2.ScaleNumbersStepScaleLines = 1;
			this.aGauge2.Size = new System.Drawing.Size(246, 200);
			this.aGauge2.TabIndex = 23;
			this.aGauge2.Text = "Compass";
			this.aGauge2.Value = 0F;
			// 
			// label1
			// 
			label1.AutoSize = true;
			label1.Location = new System.Drawing.Point(712, 15);
			label1.Name = "label1";
			label1.Size = new System.Drawing.Size(74, 13);
			label1.TabIndex = 24;
			label1.Text = "Buffer Control:";
			// 
			// cboType
			// 
			this.cboType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
			this.cboType.FormattingEnabled = true;
			this.cboType.Location = new System.Drawing.Point(249, 29);
			this.cboType.Name = "cboType";
			this.cboType.Size = new System.Drawing.Size(91, 21);
			this.cboType.TabIndex = 12;
			// 
			// label2
			// 
			label2.AutoSize = true;
			label2.Location = new System.Drawing.Point(182, 32);
			label2.Name = "label2";
			label2.Size = new System.Drawing.Size(57, 13);
			label2.TabIndex = 11;
			label2.Text = "Run Type:";
			// 
			// serialSettingsBindingSource
			// 
			this.serialSettingsBindingSource.DataSource = typeof(SerialPortListener.Serial.SerialSettings);
			// 
			// MainForm
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(865, 528);
			this.Controls.Add(label1);
			this.Controls.Add(this.aGauge2);
			this.Controls.Add(this.aGauge1);
			this.Controls.Add(this.tBufferLength);
			this.Controls.Add(this.compass_initial);
			this.Controls.Add(this.btnMotor);
			this.Controls.Add(this.tRight);
			this.Controls.Add(this.tLeft);
			this.Controls.Add(this.tFront);
			this.Controls.Add(this.compass);
			this.Controls.Add(this.tbData);
			this.Controls.Add(this.btnStop);
			this.Controls.Add(this.btnStart);
			this.Controls.Add(this.groupBox1);
			this.Name = "MainForm";
			this.Text = "Project Blacky ";
			this.Load += new System.EventHandler(this.MainForm_Load);
			this.Shown += new System.EventHandler(this.MainForm_Shown);
			this.groupBox1.ResumeLayout(false);
			this.groupBox1.PerformLayout();
			((System.ComponentModel.ISupportInitialize)(this.serialSettingsBindingSource)).EndInit();
			this.ResumeLayout(false);
			this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.BindingSource serialSettingsBindingSource;
        private System.Windows.Forms.ComboBox baudRateComboBox;
        private System.Windows.Forms.ComboBox dataBitsComboBox;
        private System.Windows.Forms.ComboBox parityComboBox;
        private System.Windows.Forms.ComboBox portNameComboBox;
        private System.Windows.Forms.ComboBox stopBitsComboBox;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btnStart;
        private System.Windows.Forms.TextBox tbData;
        private System.Windows.Forms.Button btnStop;
		private System.Windows.Forms.AGauge compass;
		private System.Windows.Forms.TextBox tFront;
		private System.Windows.Forms.TextBox tLeft;
		private System.Windows.Forms.TextBox tRight;
		private System.Windows.Forms.TextBox tBufferLength;
		private System.Windows.Forms.Button btnMotor;
		private System.Windows.Forms.AGauge compass_initial;
		private System.Windows.Forms.AGauge aGauge1;
		private System.Windows.Forms.AGauge aGauge2;
		private System.Windows.Forms.ComboBox cboType;
    }
}

