using APIPessoa.DTOs;
using APIPessoa.JWT;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APIPessoa.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthorizeController : ControllerBase
    {
        private readonly UserManager<IdentityUser> _userManager;
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly ITokenGenerate _tokenGenerate;

        public AuthorizeController(SignInManager<IdentityUser> signInManager, UserManager<IdentityUser> userManager, ITokenGenerate tokenGenerate)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _tokenGenerate = tokenGenerate;
        }

        [HttpPost("Register")] 
        public async Task<ActionResult> UserRegister([FromBody] UserRegisterDTO model)
        {
            var userExist = await _userManager.FindByIdAsync(model.Email);

            if (userExist != null)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, "User Already Exist!");
            }

            var user = new IdentityUser
            {
                UserName = model.Email,
                Email = model.Email
            };

            var result = await _userManager.CreateAsync(user, model.Password);

            if (result.Succeeded)
            {
                var login = new UserLoginDTO
                {
                    Password = model.Password,
                    Email = model.Email
                };

                await _signInManager.SignInAsync(user, false);

                return Ok(_tokenGenerate.UserTokenGenaerate(login));
            }
            else
            {
                var stringBuilder = new StringBuilder();

                foreach (var error in result.Errors)
                {
                    stringBuilder.Append(error.Description);
                    stringBuilder.Append("\r\n");
                }
                return Ok(new { result = $"Register fail: {stringBuilder.ToString()}" });
            }
        }
    }
}
