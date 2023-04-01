create database HighSchool;
go
use HighSchool
go 

-- tables
-- **********************************************************************************************************************************************************************
-- **********************************************************************************************************************************************************************
-- **********************************************************************************************************************************************************************
create table Docente(
	IdDocente int primary key,
	NombreDocente nvarchar(30),
	ApellidoDocente nvarchar(30)
);
go

create procedure AdminDocente
	@IdDocente int,
	@NombreDocente nvarchar(30),
	@ApellidoDocente nvarchar(30),
	@Operation char(1)
as
begin
	if @Operation = 'I'
	begin
		insert into Docente values(
			@IdDocente,
			@NombreDocente,
			@ApellidoDocente
		)
	end
	if @Operation = 'U'
	begin
		update Docente set NombreDocente = @NombreDocente, ApellidoDocente = @ApellidoDocente where IdDocente = @IdDocente;
	end
	if @Operation = 'D'
	begin
		delete from Docente where IdDocente = @IdDocente;
	end
	if @Operation = 'R'
	begin
		select * from Docente;
	end
end
go

execute AdminDocente @Operation = 'R',
@IdDocente = 200,
@NombreDocente = 'Luis Carlos',
@ApellidoDocente = 'Lopez Perez'
go

-- **********************************************************************************************************************************************************************
-- **********************************************************************************************************************************************************************
-- **********************************************************************************************************************************************************************

create table Grupo(
	IdGrupo int primary key,
	NombreGrupo nvarchar(30),
	Aula nvarchar(30),
	CodAsignatura nvarchar(30)
);
go

create procedure AdminGrupo
	@IdGrupo int,
	@NombreGrupo nvarchar(30),
	@Aula nvarchar(30),
	@CodAsignatura nvarchar(30),
	@Operation char(1)
as
begin
	if @Operation = 'I'
	begin
		insert into Grupo values(
			@IdGrupo,
			@NombreGrupo,
			@Aula,
			@CodAsignatura
		)
	end
	if @Operation = 'U'
	begin
		update Grupo set NombreGrupo = @NombreGrupo, Aula = @Aula, CodAsignatura = @CodAsignatura where IdGrupo = @IdGrupo;
	end
	if @Operation = 'D'
	begin
		delete from Grupo where IdGrupo = @IdGrupo;
	end
	if @Operation = 'R'
	begin
		select * from Grupo;
	end
end
go

execute AdminGrupo @Operation = 'R',
@IdGrupo = 3,
@NombreGrupo = 'MI07A',
@Aula = 'LAB04',
@CodAsignatura = 'IC-01'
go

-- **********************************************************************************************************************************************************************
-- **********************************************************************************************************************************************************************
-- **********************************************************************************************************************************************************************

create table Asignatura(
	CodAsignatura nvarchar(30) primary key,
	NombreAsignatura nvarchar(30),
	Cuatrimestre nvarchar(30),
	Orden int
);
go

create procedure AdminAsignatura
	@CodAsignatura nvarchar(30),
	@NombreAsignatura nvarchar(30),
	@Cuatrimestre nvarchar(30),
	@Orden int,
	@Operation char(1)
as
begin
	if @Operation = 'I'
	begin
		insert into Asignatura values(
			@CodAsignatura,
			@NombreAsignatura,
			@Cuatrimestre,
			@Orden
		)
	end
	if @Operation = 'U'
	begin
		update Asignatura set NombreAsignatura = @NombreAsignatura, Cuatrimestre = @Cuatrimestre, Orden = @Orden where CodAsignatura = @CodAsignatura;
	end
	if @Operation = 'D'
	begin
		delete from Asignatura where CodAsignatura = @CodAsignatura;
	end
	if @Operation = 'R'
	begin
		select * from Asignatura;
	end
end
go

execute AdminAsignatura @Operation = 'R',
@CodAsignatura = 'IC-01',
@NombreAsignatura = 'PROGRAMACION',
@Cuatrimestre = 'VI',
@Orden = 2
go

-- **********************************************************************************************************************************************************************
-- **********************************************************************************************************************************************************************
-- **********************************************************************************************************************************************************************

create table GrupoDocente(
	IdDocente int primary key,
	IdGrupo int
);
go

create procedure AdminGrupoDocente
	@IdDocente int,
	@IdGrupo int,
	@Operation char(1)
as
begin
	if @Operation = 'I'
	begin
		insert into GrupoDocente values(
			@IdDocente,
			@IdGrupo
		)
	end
	if @Operation = 'U'
	begin
		update GrupoDocente set IdGrupo = @IdGrupo where IdDocente = @IdDocente;
	end
	if @Operation = 'D'
	begin
		delete from GrupoDocente where IdDocente = @IdDocente;
	end
	if @Operation = 'R'
	begin
		select * from GrupoDocente;
	end
end
go

execute AdminGrupoDocente @Operation = 'R',
@IdDocente = 210,
@IdGrupo = 3
go