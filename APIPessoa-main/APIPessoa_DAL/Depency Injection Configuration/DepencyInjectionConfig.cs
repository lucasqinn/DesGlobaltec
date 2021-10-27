using APIPessoa_DAL.Interfaces;
using APIPessoa_DAL.Repositories;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIPessoa_DAL.Depency_Injection_Configuration
{
    public static class DepencyInjectionConfig
    {
        public static void ConfigureDI(this IServiceCollection services)
        {
            services.AddTransient<IPeople, PeopleRepository>();
        }
    }
}
