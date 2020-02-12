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
                this.textBoxSearch.Text, this.textBox1.Text, this.textBox2.Text, this.textBoxMaxResults.Text);
            this.textBoxResultsCount.Text = linelist.Length.ToString(); 
            StringBuilder sb = new StringBuilder(linelist.Length); 
            foreach (string s in linelist) 
                sb.Append(s + System.Environment.NewLine);
            this.textBoxLines.Text = sb.ToString();
            if (this.checkBoxOutput.Checked)
                System.IO.File.WriteAllText(this.textBoxOutputFile.Text, sb.ToString()); 
        }

        private string[] GetLinesFromTextFile(Object fileFullPath, Object searchText, Object startline, Object endline, Object maxResults)
        {
            string[] lines;
            var list = new List<string>();

            try
            {
                this.LoadLinesFromTextFile(ref list, fileFullPath.ToString(),
                    searchText.ToString(), Convert.ToInt32(startline), Convert.ToInt32(endline), Convert.ToInt32(maxResults));
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
            string fileFullPath, string searchText, int startLineNumber, int finishLineNumber, int maxResults) 
        {
            int readLineCount = 0;
            int resultsCount = 0; 
            var fileStream = new System.IO.FileStream(fileFullPath, System.IO.FileMode.Open, System.IO.FileAccess.Read);
            using (var streamReader = new System.IO.StreamReader(fileStream, Encoding.UTF8))
            {
                string line;
                while (resultsCount < maxResults && (line = streamReader.ReadLine()) != null && readLineCount < finishLineNumber)
                {
                    readLineCount++;
                    if (readLineCount >= startLineNumber)
                    {
                        if (searchText.Trim().Length == 0)
                        {
                            list.Add(line);
                            resultsCount++;
                        }
                        else
                        {
                            if (line.ToUpper().Contains(searchText.ToUpper()))
                            {
                                list.Add(line);
                                resultsCount++;
                            }
                        }
                    }
                }
            }


        }

        private void FormMain_Load(object sender, EventArgs e)
        {
            this.textBoxOutputFile.Text += System.DateTime.Now.ToString("yyyyMMdd_HHmmss") + ".txt";
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            this.textBoxResultsCount.Text = this.TotalLines(this.textBoxPathForDataFile.Text).ToString();
            this.textBox2.Text = this.textBoxResultsCount.Text; 
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

        private void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
