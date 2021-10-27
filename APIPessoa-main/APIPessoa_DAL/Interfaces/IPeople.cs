using APIPessoa_BLL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIPessoa_DAL.Interfaces
{
    public interface IPeople
    {
        Task<IEnumerable<People>> GetAll();
        Task<People> GetById(int id);
        Task<IEnumerable<People>> GetByUf(string uf);
        Task Insert(People people);
        Task Update(People people);
        Task Delete(int id);
    }
}
