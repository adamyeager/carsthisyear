using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using CarsThisYear.Data;
using System.Collections.Generic;

namespace CarsThisYear.Data.Tests
{
    [TestClass]
    public class DataEntry
    {
        [TestMethod]
        public void SeedData()
        {
            using(CarsThisYearContextContainer context = new CarsThisYearContextContainer())
            {
                // Seed general colors
                var generalColors = new List<GeneralColor>
                {
                    new GeneralColor { Name = "Red" },
                    new GeneralColor { Name = "Orange" },
                    new GeneralColor { Name = "Yellow" },
                    new GeneralColor { Name = "Green" },
                    new GeneralColor { Name = "Blue" },
                    new GeneralColor { Name = "Violet" },
                };
                generalColors.ForEach(o => context.GeneralColors.Add(o));
                context.SaveChanges();

                // Seed Makes
                //var makes = new List<Make>
                //{
                //    new Make { Name = "Honda", Description = "Honda motor company." }
                //};
                //makes.ForEach(o => context.Makes.Add(o));
                //context.SaveChanges();
            }
        }
    }
}
