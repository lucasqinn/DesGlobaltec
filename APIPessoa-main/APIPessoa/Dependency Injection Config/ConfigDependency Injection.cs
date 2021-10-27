using APIPessoa.JWT;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIPessoa.Dependency_Injection_Config
{
    public static class Config_Dependency__Injection
    {
        public static void ConfigureDiWebAPI(this IServiceCollection services)
        {
            services.AddTransient<ITokenGenerate, TokenGenerate>();
        }
    }
}
