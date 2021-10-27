using APIPessoa.DTOs;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace APIPessoa.JWT
{
    public class TokenGenerate : ITokenGenerate
    {
        private readonly IConfiguration _configuration;
        public TokenGenerate(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        public UserToken UserTokenGenaerate(UserLoginDTO user)
        {
            var claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.UniqueName, user.Email),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
            };

            var key = new SymmetricSecurityKey(
                Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));

            var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var expiration = _configuration["TokenConfiguration:ExpireHours"];

            var timeExpiration = DateTime.UtcNow.AddHours(double.Parse(expiration));

            JwtSecurityToken token = new JwtSecurityToken(
                issuer: _configuration["TokenConfiguration:Issuer"],
                audience: _configuration["TokenConfiguration:Audience"],
                claims: claims,
                expires: timeExpiration,
                signingCredentials: credentials);

            return new UserToken
            {
                Authenticated = true,
                Token = new JwtSecurityTokenHandler().WriteToken(token),
                Expiration = timeExpiration,
                Message = "Generated with success JWT token"
            };
        }
    }
}
