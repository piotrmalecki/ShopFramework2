using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ShopFramework2.Startup))]
namespace ShopFramework2
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
