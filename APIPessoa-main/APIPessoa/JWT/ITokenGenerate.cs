using APIPessoa.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace APIPessoa.JWT
{
    public interface ITokenGenerate
    {
        UserToken UserTokenGenaerate(UserLoginDTO user);
    }
}
