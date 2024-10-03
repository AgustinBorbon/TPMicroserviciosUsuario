using Dapper;
using Microsoft.Data.SqlClient;


var builder = WebApplication.CreateBuilder(args);
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAllOrigins",
        policy =>
        {
            policy.AllowAnyOrigin()
                  .AllowAnyMethod()
                  .AllowAnyHeader();
        });
});
var app = builder.Build();
app.UseCors("AllowAllOrigins");
app.UseCors(builder => builder
    .AllowAnyOrigin()
    .AllowAnyMethod()
    .AllowAnyHeader());

app.UseRouting();

string connectionString = builder.Configuration.GetConnectionString("DefaultConnection");

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.MapGet("/api/clientes/{id}", async (int id) =>
{
    using var connection = new SqlConnection(connectionString);
    var paquete = await connection.QuerySingleOrDefaultAsync<Paquete>(
        "SELECT * FROM Paquete WHERE Id = @Id", new { Id = id });

    return paquete is not null ? Results.Ok(paquete) : Results.NotFound();
});

app.MapPost("/api/persona", async (Persona persona) =>
{
    using var connection = new SqlConnection(connectionString);
    var query = "INSERT INTO Persona (nombre, apellido, dni, telefono, email) VALUES (@Nombre, @Apellido, @Dni, @Telefono, @Email);" +
                "SELECT CAST(SCOPE_IDENTITY() as int)";
    var id = await connection.ExecuteScalarAsync<int>(query, persona);
    return Results.Ok(id); // Retorna el ID generado.
});

app.MapPost("/api/direccion", async (Direccion direccion) =>
{
    using var connection = new SqlConnection(connectionString);
    var query = "INSERT INTO Direccion (calle, altura, localidad_id) VALUES (@Calle, @Altura, @Localidad_Id);" +
                "SELECT CAST(SCOPE_IDENTITY() as int)";
    var id = await connection.ExecuteScalarAsync<int>(query, direccion);
    return Results.Ok(id); // Retorna el ID generado.
});

app.MapPost("/api/paquete", async (Paquete paquete) =>
{
    using var connection = new SqlConnection(connectionString);
    var query = "INSERT INTO Paquete (direccion1_id, direccion2_id, persona1_id, persona2_id, estado, precio) VALUES (@Direccion1_Id, @Direccion2_Id, @Persona1_Id, @Persona2_Id, @Estado, @Precio);" +
                "SELECT CAST(SCOPE_IDENTITY() as int)";
    var id = await connection.ExecuteScalarAsync<int>(query, paquete);
    return Results.Ok(id); // Retorna el ID del paquete.
});

app.Run();

public class Paquete
{
    public int Id { get; set; }
    public int direccion1_id { get; set; }
    public int direccion2_id { get; set; }
    public int persona1_id { get; set; }
    public int persona2_id { get; set; }
    public string estado {  get; set; }
    public float precio {  get; set; }
}

public class Persona
{
    public int Id { get; set; }
    public string nombre { get; set; }
    public string apellido { get; set; }
    public int dni { get; set; }
    public int telefono { get; set; }
    public string email { get; set; }
}
public class Direccion
{
    public int Id { get; set; }
    public string calle { get; set; }
    public int altura { get; set; }
    public int localidad_id { get; set; }
}
