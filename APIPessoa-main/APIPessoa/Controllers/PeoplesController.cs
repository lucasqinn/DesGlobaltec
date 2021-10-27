using APIPessoa_BLL.Models;
using APIPessoa_DAL.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIPessoa.Controllers
{
    [Authorize(AuthenticationSchemes = "Bearer")]
    [Route("api/[controller]")]
    [ApiController]
    public class PeoplesController : ControllerBase
    {
        private readonly IPeople _people;
        public PeoplesController(IPeople people)
        {
            _people = people;
        }

        [HttpGet]
        public async Task<IEnumerable<People>> GetAllPeoples()
        {
            return await _people.GetAll();
        }

        [HttpPost]
        public async Task<ActionResult> Post([FromBody] People people)
        {
            try
            {
                await _people.Insert(people);

                return new ObjectResult(people) { StatusCode = 200 };
            }
            catch (Exception)
            {

                return StatusCode(StatusCodes.Status500InternalServerError, "Erro ao inserir uma pessoa!");
            }

        }

        [HttpGet("uf={uf}")]
        public async Task<IEnumerable<People>> GetPeoplesByUf(string uf)
        {
            return await _people.GetByUf(uf);
        }

        [HttpGet("{id}")]
        public async Task<People> GetPeoplesById(int id)
        {
            return await _people.GetById(id);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult> Put(int id, [FromBody] People people)
        {
            try
            {
                if (id != people.PeopleId)
                {
                    return BadRequest();
                }

                await _people.Update(people);

                return new ObjectResult(people);
            }
            catch (Exception)
            {

                return StatusCode(StatusCodes.Status500InternalServerError, "Erro ao atualizar os dados");
            }
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult<People>> Delete (int id)
        {
            try
            {
                var peopleId = await _people.GetById(id);

                if (peopleId == null)
                {
                    return NotFound("Pessoa não encontrada para esse ID");
                }

                await _people.Delete(id);

                return peopleId;
            }
            catch (Exception)
            {

                return StatusCode(StatusCodes.Status500InternalServerError, "Erro ao excluir essa pessoa!");
            }
        }

    }
}
