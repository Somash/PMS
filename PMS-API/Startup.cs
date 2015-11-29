using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PMS_API.Startup))]
namespace PMS_API
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
