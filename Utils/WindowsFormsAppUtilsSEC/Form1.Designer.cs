namespace WindowsFormsAppUtilsSEC
{
    partial class FormMain
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
            this.label1 = new System.Windows.Forms.Label();
            this.textBoxPathForDataFile = new System.Windows.Forms.TextBox();
            this.buttonShowLines = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.textBoxLines = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(22, 31);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(133, 20);
            this.label1.TabIndex = 0;
            this.label1.Text = "Path for Data File";
            // 
            // textBoxPathForDataFile
            // 
            this.textBoxPathForDataFile.Location = new System.Drawing.Point(196, 25);
            this.textBoxPathForDataFile.Name = "textBoxPathForDataFile";
            this.textBoxPathForDataFile.Size = new System.Drawing.Size(613, 26);
            this.textBoxPathForDataFile.TabIndex = 1;
            this.textBoxPathForDataFile.Text = "C:\\alex2020hp\\sec2019q4\\num.txt";
            // 
            // buttonShowLines
            // 
            this.buttonShowLines.Location = new System.Drawing.Point(826, 20);
            this.buttonShowLines.Name = "buttonShowLines";
            this.buttonShowLines.Size = new System.Drawing.Size(111, 35);
            this.buttonShowLines.TabIndex = 2;
            this.buttonShowLines.Text = "Show Lines";
            this.buttonShowLines.UseVisualStyleBackColor = true;
            this.buttonShowLines.Click += new System.EventHandler(this.ButtonShowLines_Click);
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(956, 24);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(84, 26);
            this.textBox1.TabIndex = 3;
            this.textBox1.Text = "1";
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(1088, 24);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(100, 26);
            this.textBox2.TabIndex = 4;
            this.textBox2.Text = "60";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(1046, 27);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(27, 20);
            this.label2.TabIndex = 5;
            this.label2.Text = "to ";
            // 
            // textBoxLines
            // 
            this.textBoxLines.Location = new System.Drawing.Point(12, 62);
            this.textBoxLines.Multiline = true;
            this.textBoxLines.Name = "textBoxLines";
            this.textBoxLines.Size = new System.Drawing.Size(1457, 427);
            this.textBoxLines.TabIndex = 6;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(1206, 20);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(114, 31);
            this.button1.TabIndex = 7;
            this.button1.Text = "Count Lines";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.Button1_Click);
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1474, 501);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.textBoxLines);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.buttonShowLines);
            this.Controls.Add(this.textBoxPathForDataFile);
            this.Controls.Add(this.label1);
            this.Name = "FormMain";
            this.Text = "SEC Data Utilities";
            this.Load += new System.EventHandler(this.FormMain_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBoxPathForDataFile;
        private System.Windows.Forms.Button buttonShowLines;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textBoxLines;
        private System.Windows.Forms.Button button1;
    }
}

