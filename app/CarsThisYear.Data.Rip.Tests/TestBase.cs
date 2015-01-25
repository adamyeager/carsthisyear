using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarsThisYear.Data.Rip.Tests
{
    public abstract class TestBase
    {
        public TestBase()
        {
            KbbManager = new KbbRipManager();
        }

        /// <summary>
        /// Gets or sets the KBB manager.
        /// </summary>
        /// <value>
        /// The KBB manager.
        /// </value>
        public KbbRipManager KbbManager { get; set; }
    }
}
