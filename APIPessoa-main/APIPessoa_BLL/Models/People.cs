using System;
using System.ComponentModel.DataAnnotations;
using System.Globalization;

namespace APIPessoa_BLL.Models
{
    public class People
    {
        private DateTime _dataDeNascimento;
        [Key]
        public int PeopleId { get; set; }
        [Required]
        [MaxLength(80)]
        public string Nome { get; set; }
        [Required]
        [MaxLength(16)]
        public string CPF { get; set; }
        [Required]
        [MaxLength(2)]
        public string UF { get; set; }
        [Required]
        public DateTime DataDeNascimento { get => _dataDeNascimento; set => _dataDeNascimento = value.ToUniversalTime(); }

        

    }
}
