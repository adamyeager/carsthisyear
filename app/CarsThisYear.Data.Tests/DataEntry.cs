using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using CarsThisYear.Data;
using System.Collections.Generic;
using System.Linq;

namespace CarsThisYear.Data.Tests
{
    [TestClass]
    public class DataEntry
    {
        #region Properties

        private CarsThisYearContextContainer Context { get; set; }

        #endregion Properties


        [TestInitialize]
        public void SeedInit()
        {
            Context = new CarsThisYearContextContainer();
        }


        [TestCleanup]
        public void SeedCleanup()
        {
            Context.Dispose();
            Context = null;
        }


        #region Test Methods

        [TestMethod]
        public void SeedData()
        {
            SeedGeneralColors();
            SeedGeneralEngines();
            
            //SeedMakes();
            //SeedModels();
        }

        #endregion Test Methods


        #region Private methods

        private void SeedGeneralColors()
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
            generalColors.ForEach(o => Context.GeneralColors.Add(o));
            Context.SaveChanges();
        }

        private void SeedGeneralEngines()
        {
            var generalEngines = new List<GeneralEngine>
            {
                new GeneralEngine { Name = "V 8 Cylinder", ShortName = "V8", Cylinders = 8 },
                new GeneralEngine { Name = "V 6 Cylinder", ShortName = "V6", Cylinders = 6 },
                new GeneralEngine { Name = "V 4 Cylinder", ShortName = "V4", Cylinders = 4 },
                new GeneralEngine { Name = "Inline 4 Cylinder", ShortName = "I4", Cylinders = 4 },
                new GeneralEngine { Name = "Inline 6 Cylinder", ShortName = "I6", Cylinders = 6 },
            };
            generalEngines.ForEach(o => Context.GeneralEngines.Add(o));
            Context.SaveChanges();
        }

        private void SeedMakes()
        {
            // Seed Makes
            var makes = new List<Make>
            {
                new Make { Name = "Acura" },
                new Make { Name = "Audi" },
                new Make { Name = "BMW" },
                new Make { Name = "Buick" },
                new Make { Name = "Cadillac" },
                new Make { Name = "Chevrolet" },
                new Make { Name = "Dodge" },
                new Make { Name = "FIAT" },
                new Make { Name = "Ford" },
                new Make { Name = "GMC" },
                new Make { Name = "Honda" },
                new Make { Name = "Hyundai" },
                new Make { Name = "Infiniti" },
                new Make { Name = "Jeep" },
                new Make { Name = "Kia" },
                new Make { Name = "Land Rover" },
                new Make { Name = "Lexus" },
                new Make { Name = "Lincoln" },
                new Make { Name = "Mazda" },
                new Make { Name = "Mercedes-Benz" },
                new Make { Name = "Mini" },
                new Make { Name = "Mitsubishi" },
                new Make { Name = "Nissan" },
                new Make { Name = "Porsche" },
                new Make { Name = "Smart" },
                new Make { Name = "Subaru" },
                new Make { Name = "Toyota" },
                new Make { Name = "Volkswagen" },
                new Make { Name = "Volvo" }
            };
            makes.ForEach(o => Context.Makes.Add(o));
            Context.SaveChanges();

            //Associate parent makers
            var toyota = makes.Where(o => o.Name == "Toyota").First();
            var lexus = makes.Where(o => o.Name == "Lexus").First();
            lexus.ParentId = toyota.Id;

            var honda = makes.Where(o => o.Name == "Honda").First();
            var acura = makes.Where(o => o.Name == "Acura").First();
            acura.ParentId = honda.Id;

            var gmc = makes.Where(o => o.Name == "GMC").First();
            var chevy = makes.Where(o => o.Name == "Chevrolet").First();
            chevy.ParentId = gmc.Id;
            var caddy = makes.Where(o => o.Name == "Cadillac").First();
            caddy.ParentId = gmc.Id;
            var buick = makes.Where(o => o.Name == "Buick").First();
            buick.ParentId = gmc.Id;

            var vw = makes.Where(o => o.Name == "Volkswagen").First();
            var audi = makes.Where(o => o.Name == "Audi").First();
            audi.ParentId = vw.Id;

            var bmw = makes.Where(o => o.Name == "BMW").First();
            var mini = makes.Where(o => o.Name == "Mini").First();
            mini.ParentId = bmw.Id;

            Context.SaveChanges();
        }


        private void SeedModels()
        {
            try
            {
                var toyota = Context.Makes.Where(o => o.Name == "Toyota").FirstOrDefault();
                Model FourRunner = new Model()
                {
                    Name = "4Runner",
                    Year = 2015,
                    MakeId = toyota.Id
                };

                Context.Models.Add(FourRunner);
                Context.SaveChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion Private methods
    }
}
