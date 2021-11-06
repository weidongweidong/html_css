	drop table if exists t_student;
	drop table if exists t_class;
	create table t_class(
		cid int,
		cname varchar(255),
		primary key (cid)
	);

	create table t_student(
		sid int ,
		sname varchar(255),
		classno int,
		age int,
        primary key(sid),
		foreign key(classno) references t_class(cid)
	);
	
	insert into t_class values (1,'网络1501班');
    insert into t_class values (2,'网络1502班');
    insert into t_class values (3,'网络1503班');
	insert into t_student values (1001,'陈伟东',2,18);
	insert into t_student values (1002,'亢晓梅',3,16);
	select  * from t_class;
	select  * from t_student;