using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CarsThisYear.Web.Startup))]
namespace CarsThisYear.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
