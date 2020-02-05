using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsAppUtilsSEC
{
    public partial class FormMain : Form
    {
        public FormMain()
        {
            InitializeComponent();
        }

        private void ButtonShowLines_Click(object sender, EventArgs e)
        {
            this.textBoxLines.Text = String.Empty; 
            string[] linelist = this.GetLinesFromTextFile(this.textBoxPathForDataFile.Text,
                this.textBox1.Text, this.textBox2.Text);
            foreach (string s in linelist)
            {
                this.textBoxLines.Text += s + System.Environment.NewLine;
            }
        }

        private string[] GetLinesFromTextFile(Object fileFullPath, Object startline, Object endline)
        {
            string[] lines;
            var list = new List<string>();

            try
            {
                this.LoadLinesFromTextFile(ref list, fileFullPath.ToString(),
                    Convert.ToInt32(startline), Convert.ToInt32(endline));
            }
            catch (Exception ex)
            {
                list.Add(String.Format("'{0}' '{1}' '{2}' ", fileFullPath, startline, endline));
                list.Add(ex.Message);
            }

            lines = list.ToArray();
            return lines;
        }


        private void LoadLinesFromTextFile(ref List<string> list, 
            string fileFullPath, int startLineNumber, int finishLineNumber) 
        {
            int readLineCount = 0; 
            var fileStream = new System.IO.FileStream(fileFullPath, System.IO.FileMode.Open, System.IO.FileAccess.Read);
            using (var streamReader = new System.IO.StreamReader(fileStream, Encoding.UTF8))
            {
                string line;
                while ((line = streamReader.ReadLine()) != null && readLineCount < finishLineNumber)
                {
                    readLineCount++; 
                    if (readLineCount >= startLineNumber)
                        list.Add(line);
                }
            }


        }

        private void FormMain_Load(object sender, EventArgs e)
        {
          //
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            this.textBoxLines.Text = this.TotalLines(this.textBoxPathForDataFile.Text).ToString(); 
        }

        int TotalLines(string filePath)
        {
            using (System.IO.StreamReader r = new System.IO.StreamReader(filePath))
            {
                int i = 0;
                while (r.ReadLine() != null) { i++; }
                return i;
            }
        }
    }
}
