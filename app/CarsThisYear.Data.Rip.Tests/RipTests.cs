using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace CarsThisYear.Data.Rip.Tests
{
    [TestClass]
    public class RipTests : TestBase
    {
        [TestMethod]
        public void GetMakesTest()
        {
            var results = KbbManager.GetMakes();
        }
    }
}
