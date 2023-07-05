using Microsoft.AspNetCore.Mvc;
using Server.DTO;
using Server.Models;
namespace Server.Controllers
{
    [ApiController]
    [Route("/projeto")]
    public class ProjetoController : ControllerBase
    {
        private Db _context;

        public ProjetoController(Db context)
        {
            _context = context;
        }
        [HttpGet]
        public IActionResult getAll()
        {
            return Ok(_context.Projeto!.ToArray());
        }

        [HttpGet("/projeto/{id}")]
        public IActionResult find(int id)
        {
            var projeto = _context.Projeto!.Find(id);
            if (projeto == null)
            {
                return NotFound();
            }
            return Ok(projeto);
        }

        [HttpPut]
        public IActionResult update(ProjetoDTO dTO)
        {
            var projeto = _context.Projeto!.Find(dTO.projetoId);
            if (projeto == null)
                return NotFound();
            projeto.Nome = dTO.Nome;
            projeto.DataInicio = dTO.DataInicio;
            projeto.DataTermino = dTO.DataTermino;
            projeto.Descricao = dTO.Descricao;
            _context.SaveChanges();
            return Ok();
        }

        [HttpDelete("/projeto/{id}")]
        public IActionResult remove(int id)
        {
            var projeto = _context.Projeto!.Find(id);
            if (projeto == null)
                return NotFound();
            _context.Projeto.Remove(projeto);
            _context.SaveChanges();
            return Ok();
        }

        [HttpPost]
        public IActionResult Create(ProjetoDTO dto)
        {
            var projeto = new ProjetoModel()
            {
                DataInicio = dto.DataInicio,
                DataTermino = dto.DataTermino,
                Descricao = dto.Descricao,
                Nome = dto.Nome,
                projetoId = _context.Projeto!.Max(table => table.projetoId) + 1,
            };
            _context.Projeto!.Add(projeto);
            _context.SaveChanges();
            return Ok();
        }
    }
}