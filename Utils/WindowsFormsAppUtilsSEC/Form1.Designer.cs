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
            this.textBoxSearch = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.textBoxMaxResults = new System.Windows.Forms.TextBox();
            this.textBoxOutputFile = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.checkBoxOutput = new System.Windows.Forms.CheckBox();
            this.textBoxResultsCount = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 31);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(133, 20);
            this.label1.TabIndex = 0;
            this.label1.Text = "Path for Data File";
            // 
            // textBoxPathForDataFile
            // 
            this.textBoxPathForDataFile.Location = new System.Drawing.Point(151, 28);
            this.textBoxPathForDataFile.Name = "textBoxPathForDataFile";
            this.textBoxPathForDataFile.Size = new System.Drawing.Size(309, 26);
            this.textBoxPathForDataFile.TabIndex = 1;
            this.textBoxPathForDataFile.Text = "C:\\alex2020hp\\sec2019q4\\raw\\num.txt";
            // 
            // buttonShowLines
            // 
            this.buttonShowLines.Location = new System.Drawing.Point(688, 24);
            this.buttonShowLines.Name = "buttonShowLines";
            this.buttonShowLines.Size = new System.Drawing.Size(102, 35);
            this.buttonShowLines.TabIndex = 2;
            this.buttonShowLines.Text = "Show Lines";
            this.buttonShowLines.UseVisualStyleBackColor = true;
            this.buttonShowLines.Click += new System.EventHandler(this.ButtonShowLines_Click);
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(797, 27);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(49, 26);
            this.textBox1.TabIndex = 3;
            this.textBox1.Text = "1";
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(876, 27);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(83, 26);
            this.textBox2.TabIndex = 4;
            this.textBox2.Text = "60";
            this.textBox2.TextChanged += new System.EventHandler(this.TextBox2_TextChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(852, 30);
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
            this.textBoxLines.Size = new System.Drawing.Size(1279, 391);
            this.textBoxLines.TabIndex = 6;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(965, 25);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(104, 31);
            this.button1.TabIndex = 7;
            this.button1.Text = "Count Lines";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.Button1_Click);
            // 
            // textBoxSearch
            // 
            this.textBoxSearch.Location = new System.Drawing.Point(466, 28);
            this.textBoxSearch.Name = "textBoxSearch";
            this.textBoxSearch.Size = new System.Drawing.Size(199, 26);
            this.textBoxSearch.TabIndex = 8;
            this.textBoxSearch.Text = "0000320193-19-000119";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(1085, 30);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(96, 20);
            this.label3.TabIndex = 9;
            this.label3.Text = "Max Results";
            // 
            // textBoxMaxResults
            // 
            this.textBoxMaxResults.Location = new System.Drawing.Point(1199, 27);
            this.textBoxMaxResults.Name = "textBoxMaxResults";
            this.textBoxMaxResults.Size = new System.Drawing.Size(64, 26);
            this.textBoxMaxResults.TabIndex = 10;
            this.textBoxMaxResults.Text = "1000";
            // 
            // textBoxOutputFile
            // 
            this.textBoxOutputFile.Location = new System.Drawing.Point(217, 463);
            this.textBoxOutputFile.Name = "textBoxOutputFile";
            this.textBoxOutputFile.Size = new System.Drawing.Size(418, 26);
            this.textBoxOutputFile.TabIndex = 12;
            this.textBoxOutputFile.Text = "C:\\alex2020hp\\sec2019q4\\temp\\";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(64, 466);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(147, 20);
            this.label4.TabIndex = 11;
            this.label4.Text = "Path for Output File";
            // 
            // checkBoxOutput
            // 
            this.checkBoxOutput.AutoSize = true;
            this.checkBoxOutput.Location = new System.Drawing.Point(27, 465);
            this.checkBoxOutput.Name = "checkBoxOutput";
            this.checkBoxOutput.Size = new System.Drawing.Size(22, 21);
            this.checkBoxOutput.TabIndex = 13;
            this.checkBoxOutput.UseVisualStyleBackColor = true;
            // 
            // textBoxResultsCount
            // 
            this.textBoxResultsCount.Location = new System.Drawing.Point(777, 466);
            this.textBoxResultsCount.Name = "textBoxResultsCount";
            this.textBoxResultsCount.Size = new System.Drawing.Size(79, 26);
            this.textBoxResultsCount.TabIndex = 15;
            this.textBoxResultsCount.Text = "?????";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(661, 469);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(110, 20);
            this.label5.TabIndex = 14;
            this.label5.Text = "Results Count";
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1310, 519);
            this.Controls.Add(this.textBoxResultsCount);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.checkBoxOutput);
            this.Controls.Add(this.textBoxOutputFile);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.textBoxMaxResults);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.textBoxSearch);
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
        private System.Windows.Forms.TextBox textBoxSearch;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox textBoxMaxResults;
        private System.Windows.Forms.TextBox textBoxOutputFile;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.CheckBox checkBoxOutput;
        private System.Windows.Forms.TextBox textBoxResultsCount;
        private System.Windows.Forms.Label label5;
    }
}

