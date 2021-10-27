using APIPessoa_BLL.Models;
using APIPessoa_DAL.Context;
using APIPessoa_DAL.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIPessoa_DAL.Repositories
{
    public class PeopleRepository : IPeople
    {
        private readonly AppDbContext _appDbContext;
        public PeopleRepository(AppDbContext appDbContext)
        {
            _appDbContext = appDbContext;
        }
        public async Task Delete(int id)
        {
            var entity = await GetById(id);
            _appDbContext.Peoples.RemoveRange(entity);
            await _appDbContext.SaveChangesAsync();
        }

        public async Task<IEnumerable<People>> GetAll()
        {
            return await _appDbContext.Peoples.ToListAsync();
        }

        public async Task<People> GetById(int id)
        {
            return await _appDbContext.Peoples.FindAsync(id);
        }

        public async Task<IEnumerable<People>> GetByUf(string uf)
        {
            return await _appDbContext.Peoples.Where(x => x.UF == uf).ToListAsync();
        }

        public async Task Insert(People people)
        {
            await _appDbContext.AddAsync(people);
            await _appDbContext.SaveChangesAsync();
        }

        public async Task Update(People people)
        {

            _appDbContext.Peoples.Update(people);
            await _appDbContext.SaveChangesAsync();
        }
    }
}
