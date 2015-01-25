using HtmlAgilityPack;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace CarsThisYear.Data.Rip
{
    public class KbbRipManager : RipManagerBase
    {
        #region Constructors

        public KbbRipManager()
        {
            BaseUrl = "http://www.kbb.com";
        }

        #endregion Constructors



        #region Properties

        

        #endregion Properties



        #region Manager Methods

        /// <summary>
        /// Gets the makes.
        /// </summary>
        /// <returns></returns>
        public List<KeyValuePair<string, string>> GetMakes()
        {
            List<KeyValuePair<string, string>> results = new List<KeyValuePair<string, string>>();

            HtmlNode bodyNode = GetHtmlBodyNodeByUrl(BaseUrl);

            foreach (var element in bodyNode.SelectNodes("//div[@id='Browse-make']//div[@class='NewCarmakes']//ul//li//a").ToList())
            {
                if (element != null)
                {
                    string make = element.InnerText;
                    string urlToMake = string.Empty;

                    if (element.HasAttributes)
                    {
                        urlToMake = element.Attributes.Where(o => o.Name == "href").Select(o => o.Value).FirstOrDefault();
                    }

                    results.Add(new KeyValuePair<string, string>(make, urlToMake));
                }
            }

            return results;
        }

        public void GetModelsByMake(string make)
        {

        }

        #endregion Manager Methods



        #region Private Helper Methods

        /// <summary>
        /// Gets the HTML body node by URL.
        /// </summary>
        /// <param name="url">The URL.</param>
        /// <returns></returns>
        private HtmlNode GetHtmlBodyNodeByUrl(string url)
        {
            var request = WebRequest.Create(url);

            using (var response = request.GetResponse())
            {
                using (var reader = new StreamReader(response.GetResponseStream()))
                {
                    Console.WriteLine(string.Format("Reqeusting {0}", url));

                    string html = reader.ReadToEnd();
                    Console.WriteLine("HTML received!");

                    HtmlNode bodyNode = GetHtmlBodyNodeByHtmlString(html);
                    return bodyNode;
                }
            }
        }


        /// <summary>
        /// Gets the HTML body node.
        /// </summary>
        /// <param name="html">The HTML.</param>
        /// <returns></returns>
        private HtmlNode GetHtmlBodyNodeByHtmlString(string html)
        {
            HtmlAgilityPack.HtmlDocument htmlDoc = new HtmlAgilityPack.HtmlDocument();

            // There are various options, set as needed
            htmlDoc.OptionFixNestedTags = true;

            // filePath is a path to a file containing the html
            htmlDoc.LoadHtml(html);

            if (htmlDoc.DocumentNode != null)
            {
                var bodyNode = htmlDoc.DocumentNode.SelectSingleNode("//body");
                return bodyNode;
            }
            else
            {
                return null;
            }
        }

        #endregion Private Helper Methods
    }
}
