有三张表： 
emp:
mysql> select * from emp;
+-------+--------+-----------+------+------------+---------+---------+--------+
| EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL     | COMM    | DEPTNO |
+-------+--------+-----------+------+------------+---------+---------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850.00 |    NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450.00 |    NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1987-04-19 | 3000.00 |    NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000.00 |    NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1500.00 |    0.00 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1987-05-23 | 1100.00 |    NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950.00 |    NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000.00 |    NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300.00 |    NULL |     10 |
+-------+--------+-----------+------+------------+---------+---------+--------+
14 rows in set (0.00 sec)

dept:
mysql> select *  from dept;
+--------+------------+----------+
| DEPTNO | DNAME      | LOC      |
+--------+------------+----------+
|     10 | ACCOUNTING | NEW YORK |
|     20 | RESEARCH   | DALLAS   |
|     30 | SALES      | CHICAGO  |
|     40 | OPERATIONS | BOSTON   |
+--------+------------+----------+
4 rows in set (0.00 sec)

salgrade:
mysql> select * from salgrade;
+-------+-------+-------+
| GRADE | LOSAL | HISAL |
+-------+-------+-------+
|     1 |   700 |  1200 |
|     2 |  1201 |  1400 |
|     3 |  1401 |  2000 |
|     4 |  2001 |  3000 |
|     5 |  3001 |  9997 |
+-------+-------+-------+
5 rows in set (0.00 sec)



1, 取得每个部门最高薪水的人员名称: 
    select 
        t.deptno , e.ename , t.max_sal
    from
        (select
            deptno , max(sal) as max_sal
        from 
            emp 
        group by
            deptno) t
    join 
        emp e
    on 
        e.deptno = t.deptno and e.sal = t.max_sal
    order by e.deptno;

    答案： 
    +--------+-------+---------+
    | deptno | ename | max_sal |
    +--------+-------+---------+
    |     10 | KING  | 5000.00 |
    |     20 | SCOTT | 3000.00 |
    |     20 | FORD  | 3000.00 |
    |     30 | BLAKE | 2850.00 |
    +--------+-------+---------+
    4 rows in set (0.00 sec)


2, 哪些人的薪水在部门的平均薪水之上？ 

    select
        m.ename 员工名称,  m.sal 员工薪水 ,  t.avg_sal 所在部门平均薪水 , t.e_deptno 所在部门编号 
    from
        (select 
                e.deptno e_deptno, avg(e.sal) avg_sal
            from 
                emp e
            group by
                deptno
        ) t
    join 
        emp m 
    on 
        m.deptno = t.e_deptno and m.sal > t.avg_sal;

    答案：
    +--------------+--------------+--------------------------+--------------------+
    | 员工名称        | 员工薪水     | 所在部门平均薪水         | 所在部门编号       |
    +--------------+--------------+--------------------------+--------------------+
    | ALLEN        |      1600.00 |              1566.666667 |                 30 |
    | JONES        |      2975.00 |              2175.000000 |                 20 |
    | BLAKE        |      2850.00 |              1566.666667 |                 30 |
    | SCOTT        |      3000.00 |              2175.000000 |                 20 |
    | KING         |      5000.00 |              2916.666667 |                 10 |
    | FORD         |      3000.00 |              2175.000000 |                 20 |
    +--------------+--------------+--------------------------+--------------------+
    6 rows in set (0.00 sec)


3,  取得部门中（所有人的）平均的薪水等级，如下：
    select
        e.deptno 部门id ,  avg(s.GRADE) 平均薪水等级
    from 
        emp e
    join 
        salgrade s 
    on 
        e.sal between s.losal and s.hisal 
    group by 
        e.deptno;

    答案： 
    +----------+--------------------+
    | 部门id    |   平均薪水等级       |
    +----------+--------------------+
    |       20 |             2.8000 |
    |       30 |             2.5000 |
    |       10 |             3.6667 |
    +----------+--------------------+
    3 rows in set (0.00 sec)


4、不准用组函数（Max），取得最高薪水
    select 
        e.sal 最高薪水
    from 
        emp e
    order by 
        e.sal desc
    limit 1;

    答案：
    +--------------+
    | 最高薪水     |
    +--------------+
    |      5000.00 |
    +--------------+
    1 row in set (0.00 sec)

    第二种方法
    先表自连接, 取出除最大以外所有的sal值， 然后和本表再自连接 就能取出最大的那个值来了。 
    select sal from emp where sal not in (select a.sal from emp a join emp b on a.sal < b.sal );



5、取得平均薪水最高的部门的部门编号

    select 
        e.deptno ,  avg(e.sal) avgsal
    from 
        emp e
    group by 
        e.deptno 
    order by 
        avgsal desc 
    limit 1;

    +--------+-------------+
    | deptno | avgsal      |
    +--------+-------------+
    |     10 | 2916.666667 |
    +--------+-------------+
    1 row in set (0.00 sec)

第二种方法： 
    select max(t.avg_sal) from (select  deptno , avg(sal) avg_sal from emp group by deptno) t;



6、取得平均薪水最高的部门的部门名称
   
    select 
        d.dname 部门名称 , t.avg_sal 平均薪水
    from 
        (select 
            e.deptno e_deptno , avg(e.sal) avg_sal 
        from 
            emp e
        group by
            e.deptno) t
    join 
        dept d 
    on 
        d.deptno = t.e_deptno 
    order by 
        t.avg_sal desc
    limit 1;


    select 
        d.dname , avg(e.sal) avg_sal 
    from 
        emp e
    join
        dept d 
    on
        e.deptno = d.deptno 
    group by
        d.dname 
    order by 
        avg_sal desc
    limit 
        1;
        
    

    答案:
    +--------------+--------------+
    | 部门名称     | 平均薪水     |
    +--------------+--------------+
    | ACCOUNTING   |  2916.666667 |
    +--------------+--------------+
    1 row in set (0.00 sec)



7、求平均薪水的等级最低的部门的部门名称

    select 
        t.* , s.grade 
    from 
        (
            /* 根据部门名称进行分组得出部门的平均薪水 */ 
            select
                d.dname dname , avg(e.sal) avgsal
            from 
                emp e
            join 
                dept d
            on
                e.deptno = d.deptno 
            group by 
                d.deptno
        ) t
    /* 然后关联salgrade 表， 得到每个部门的平均薪水的等级 */
    join
        salgrade s 
    on
        t.avgsal between s.losal and s.hisal
    /* 再看下最低平均薪水等级是多少 ， 作为条件*/
    where 
        s.grade = (
                    select
                        s.grade
                    from 
                        (
                            /* 找到部门中最低的平均薪水 */ 
                            select
                                avg(sal) avgsal
                            from
                                emp
                            group by 
                                deptno
                            order by
                                avgsal asc
                            limit 
                                1
                        ) t
                    /* 找到部门中最低的平均薪水是多少等级的，这个级别的部门可能多着呢 */
                    join
                        salgrade s 
                    on
                        t.avgsal between s.losal and s.hisal 
                    );
    
    



    


    答案： 
    +-------+-------------+-------+
    | dname | avgsal      | grade |
    +-------+-------------+-------+
    | SALES | 1566.666667 |     3 |
    +-------+-------------+-------+
    1 row in set (0.00 sec)




8、取得比普通员工(员工代码没有在mgr字段上出现的)的最高薪水还要高的领导人姓名


1,  取出普通员工的最高薪水

select
    * 
from 
    emp 
where                                   /* 这个条件其实不用，因为 */ 
                                        /* 比普通员工的薪水还高的一定是领导， */ 
                                            empno in (
                                                    /* 查出所有领导人编号 */
                                                    select 
                                                        mgr 
                                                    from 
                                                        emp
                                                    where 
                                                        mgr  is not  null 
                                                    ) 
                                            and 
    sal > (
            /* 这个普通员工的最高薪水 */
            select
                max(sal)
            from 
                emp 
            where 
                empno not in (
                                /* 领导人的编号 */
                                select 
                                    distinct mgr 
                                from 
                                    emp 
                                where
                                    mgr is not null 
                            )
          );

    +-------+-------+-----------+------+------------+---------+------+--------+
    | EMPNO | ENAME | JOB       | MGR  | HIREDATE   | SAL     | COMM | DEPTNO |
    +-------+-------+-----------+------+------------+---------+------+--------+
    |  7566 | JONES | MANAGER   | 7839 | 1981-04-02 | 2975.00 | NULL |     20 |
    |  7698 | BLAKE | MANAGER   | 7839 | 1981-05-01 | 2850.00 | NULL |     30 |
    |  7782 | CLARK | MANAGER   | 7839 | 1981-06-09 | 2450.00 | NULL |     10 |
    |  7788 | SCOTT | ANALYST   | 7566 | 1987-04-19 | 3000.00 | NULL |     20 |
    |  7839 | KING  | PRESIDENT | NULL | 1981-11-17 | 5000.00 | NULL |     10 |
    |  7902 | FORD  | ANALYST   | 7566 | 1981-12-03 | 3000.00 | NULL |     20 |
    +-------+-------+-----------+------+------------+---------+------+--------+
    6 rows in set (0.00 sec)





9、取得薪水最高的前五名员工

select
    ename 员工名称, sal 员工薪水
from
    emp
order by
    sal desc
limit 
    5;


+--------------+--------------+
| 员工名称     | 员工薪水     |
+--------------+--------------+
| KING         |      5000.00 |
| FORD         |      3000.00 |
| SCOTT        |      3000.00 |
| JONES        |      2975.00 |
| BLAKE        |      2850.00 |
+--------------+--------------+
5 rows in set (0.00 sec)


10、取得薪水最高的第六到第十名员工

mysql> select ename 员工名称 , sal  员工薪水 from emp  order by sal desc limit 5 ,5;
+--------------+--------------+
| 员工名称     | 员工薪水     |
+--------------+--------------+
| CLARK        |      2450.00 |
| ALLEN        |      1600.00 |
| TURNER       |      1500.00 |
| MILLER       |      1300.00 |
| WARD         |      1250.00 |
+--------------+--------------+
5 rows in set (0.00 sec)


11, 取得最后入职的5名员工

mysql> select ename 员工姓名, hiredate 入职时间  from emp order by hiredate desc limit 5;
+--------------+--------------+
| 员工姓名     | 入职时间     |
+--------------+--------------+
| ADAMS        | 1987-05-23   |
| SCOTT        | 1987-04-19   |
| MILLER       | 1982-01-23   |
| JAMES        | 1981-12-03   |
| FORD         | 1981-12-03   |
+--------------+--------------+
5 rows in set (0.00 sec)



12、取得每个薪水等级有多少员工

select
    s.GRADE  薪水等级 , count(*) 员工人数 
from 
    emp e
left join 
    salgrade s
on  
    e.sal between s.losal and s.hisal
group by 
    s.grade;

+--------------+--------------+
| 薪水等级     | 员工人数     |
+--------------+--------------+
|            1 |            3 |
|            2 |            3 |
|            3 |            2 |
|            4 |            5 |
|            5 |            1 |
+--------------+--------------+
5 rows in set (0.00 sec)



13、面试题
    有3个表S(学生表)，C（课程表），SC（学生选课表）
    S（SNO，SNAME）代表（学号，姓名）  
    C（CNO，CNAME，CTEACHER）代表（课号，课名，教师）
    SC（SNO，CNO，SCGRADE）代表（学号，课号，成绩）
    问题：
    1，找出没选过“黎明”老师的所有学生姓名。
    2，列出2门以上（含2门）不及格学生姓名及平均成绩。
    3，即学过1号课程又学过2号课所有学生的姓名。
    请用标准SQL语言写出答案，方言也行（请说明是使用什么方言）。
    -----------------------------------------------------------------------------
    CREATE TABLE SC
    (
    SNO      VARCHAR(200),
    CNO      VARCHAR(200),
    SCGRADE  VARCHAR(200)
    );

    CREATE TABLE S
    (
    SNO    VARCHAR(200 ),
    SNAME  VARCHAR(200)
    );

    CREATE TABLE C
    (
    CNO       VARCHAR(200),
    CNAME     VARCHAR(200),
    CTEACHER  VARCHAR(200)
    );

    INSERT INTO C ( CNO, CNAME, CTEACHER ) VALUES ( '1', '语文', '张'); 
    INSERT INTO C ( CNO, CNAME, CTEACHER ) VALUES ( '2', '政治', '王'); 
    INSERT INTO C ( CNO, CNAME, CTEACHER ) VALUES ( '3', '英语', '李'); 
    INSERT INTO C ( CNO, CNAME, CTEACHER ) VALUES ( '4', '数学', '赵'); 
    INSERT INTO C ( CNO, CNAME, CTEACHER ) VALUES ( '5', '物理', '黎明'); 
    commit;
    
    INSERT INTO S ( SNO, SNAME ) VALUES ( '1', '学生1'); 
    INSERT INTO S ( SNO, SNAME ) VALUES ( '2', '学生2'); 
    INSERT INTO S ( SNO, SNAME ) VALUES ( '3', '学生3'); 
    INSERT INTO S ( SNO, SNAME ) VALUES ( '4', '学生4'); 
    commit;
    
    INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '1', '1', '40'); 
    INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '1', '2', '30'); 
    INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '1', '3', '20'); 
    INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '1', '4', '80'); 
    INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '1', '5', '60'); 
    INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '2', '1', '60'); 
    INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '2', '2', '60'); 
    INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '2', '3', '60'); 
    INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '2', '4', '60'); 
    INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '2', '5', '40'); 
    INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '3', '1', '60'); 
    INSERT INTO SC ( SNO, CNO, SCGRADE ) VALUES ( '3', '3', '80'); 
    commit;

    问题1.找出没选过“黎明”老师的所有学生姓名。
    即:
    select 
        s.sname 学生姓名
    from 
        s
    where 
        s.sno not in (
                    select
                        sc.sno
                    from
                        sc
                    left join 
                        c
                    on
                        c.cno = sc.cno
                    where 
                        c.CTEACHER  = '黎明'
                    group by 
                        sc.sno
                    ) 
    group by 
        s.sname;

    +--------------+
    | 学生姓名     |
    +--------------+
    | 学生3        |
    | 学生4        |
    +--------------+

    问题2: 列出2门以上（含2门）不及格学生姓名及平均成绩。

    SELECT 
        s.SNAME , avg(SCGRADE) 
    FROM 
        sc
    left join 
        s
    on 
        s.SNO = sc.SNO
    where 
        sc.SNO in (
                SELECT 
                    SNO 
                FROM 
                    sc 
                where 
                    SCGRADE <= 60 
                group by 
                    SNO 
                having 
                    count(distinct CNO) >= 2
                ) 
    group by 
        sc.SNO ,s.SNAME;

    +---------+--------------+
    | SNAME   | avg(SCGRADE) |
    +---------+--------------+
    | 学生1   |           46 |
    | 学生2   |           56 |
    +---------+--------------+
    1 row in set (0.00 sec)


    问题3: 即学过1号课程又学过2号课所有学生的姓名。

    select 
        SNAME 
    from 
        s
    where 
        SNO in (
            SELECT 
                SNO 
            FROM 
                sc 
            where 
                CNO in (1,2) 
            group by 
                SNO 
            having 
                count(distinct CNO) = 2
        );
    +----------+
    | t1_sname |
    +----------+
    | 学生1    |
    | 学生2    |
    | 学生3    |
    +----------+
    3 rows in set (0.00 sec)




14、列出所有员工及领导的姓名

select
    e1.ename 员工姓名 , ifNull(e2.ename,'没有上级')  领导名称
from 
    emp e1
left join
    emp e2
on
    e1.mgr = e2.empno 

    +--------------+--------------+
    | 员工姓名     | 领导名称     |
    +--------------+--------------+
    | SMITH        | FORD         |
    | ALLEN        | BLAKE        |
    | WARD         | BLAKE        |
    | JONES        | KING         |
    | MARTIN       | BLAKE        |
    | BLAKE        | KING         |
    | CLARK        | KING         |
    | SCOTT        | JONES        |
    | KING         | 没有上级     |
    | TURNER       | BLAKE        |
    | ADAMS        | SCOTT        |
    | JAMES        | BLAKE        |
    | FORD         | JONES        |
    | MILLER       | CLARK        |
    +--------------+--------------+
    14 rows in set (0.00 sec)



15 列出受雇日期早于其直接上级的所有员工的编号,姓名,部门名称

select
     e1.ename 员工姓名, e1.HIREDATE 入职日期 , e2.ename 领导姓名 , e2.hiredate 领导入职日期 , t.dname 员工部门名称 
from 
    emp e1 
join 
    emp e2 
on 
    e1.mgr = e2.empno
left join 
    dept t
on 
    e1.deptno = t.deptno
where
   e1.HIREDATE < e2.HIREDATE;

+--------------+--------------+--------------+--------------------+--------------------+
| 员工姓名     | 入职日期     | 领导姓名     | 领导入职日期       | 员工部门名称       |
+--------------+--------------+--------------+--------------------+--------------------+
| SMITH        | 1980-12-17   | FORD         | 1981-12-03         | RESEARCH           |
| ALLEN        | 1981-02-20   | BLAKE        | 1981-05-01         | SALES              |
| WARD         | 1981-02-22   | BLAKE        | 1981-05-01         | SALES              |
| JONES        | 1981-04-02   | KING         | 1981-11-17         | RESEARCH           |
| BLAKE        | 1981-05-01   | KING         | 1981-11-17         | SALES              |
| CLARK        | 1981-06-09   | KING         | 1981-11-17         | ACCOUNTING         |
+--------------+--------------+--------------+--------------------+--------------------+
6 rows in set (0.00 sec)




16、列出部门名称和这些部门的员工信息,同时列出那些没有员工的部门.

select 
    d.dname 部门名称 , e.* 
from 
    emp e
right join 
    dept d
on 
    e.deptno = d.deptno;


+--------------+-------+--------+-----------+------+------------+---------+---------+--------+
| 部门名称     | EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL     | COMM    | DEPTNO |
+--------------+-------+--------+-----------+------+------------+---------+---------+--------+
| RESEARCH     |  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
| SALES        |  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
| SALES        |  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
| RESEARCH     |  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975.00 |    NULL |     20 |
| SALES        |  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
| SALES        |  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850.00 |    NULL |     30 |
| ACCOUNTING   |  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450.00 |    NULL |     10 |
| RESEARCH     |  7788 | SCOTT  | ANALYST   | 7566 | 1987-04-19 | 3000.00 |    NULL |     20 |
| ACCOUNTING   |  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000.00 |    NULL |     10 |
| SALES        |  7844 | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1500.00 |    0.00 |     30 |
| RESEARCH     |  7876 | ADAMS  | CLERK     | 7788 | 1987-05-23 | 1100.00 |    NULL |     20 |
| SALES        |  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950.00 |    NULL |     30 |
| RESEARCH     |  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000.00 |    NULL |     20 |
| ACCOUNTING   |  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300.00 |    NULL |     10 |
| OPERATIONS   |  NULL | NULL   | NULL      | NULL | NULL       |    NULL |    NULL |   NULL |
+--------------+-------+--------+-----------+------+------------+---------+---------+--------+
15 rows in set (0.00 sec)


17、列出至少有5个员工的所有部门

select
    e.deptno , count(e.empno)
from 
    emp e
group by
    e.deptno
having
    count(e.empno) >= 5;

+--------+----------------+
| deptno | count(e.empno) |
+--------+----------------+
|     20 |              5 |
|     30 |              6 |
+--------+----------------+
2 rows in set (0.00 sec)


18 列出薪金比"SMITH"多的所有员工信息.

select 
    *
from 
    emp
where 
    sal > (select sal from emp where ename = 'SMITH');


+-------+--------+-----------+------+------------+---------+---------+--------+
| EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL     | COMM    | DEPTNO |
+-------+--------+-----------+------+------------+---------+---------+--------+
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850.00 |    NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450.00 |    NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1987-04-19 | 3000.00 |    NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000.00 |    NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1500.00 |    0.00 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1987-05-23 | 1100.00 |    NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950.00 |    NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000.00 |    NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300.00 |    NULL |     10 |
+-------+--------+-----------+------+------------+---------+---------+--------+
13 rows in set (0.01 sec)




19、列出所有"CLERK"(办事员)的姓名及其部门名称,部门的人数.

select
    e.ename , d.dname , dd.count
from 
    emp e
left join 
    dept d
on 
    e.deptno = d.deptno 
left join 
    (
        select ee.deptno deptno, count(ee.empno) count from emp ee group by ee.deptno
    ) dd 
on
    dd.deptno = e.deptno
where 
    e.job = 'clerk';



+--------+------------+-------+
| ename  | dname      | count |
+--------+------------+-------+
| SMITH  | RESEARCH   |     5 |
| ADAMS  | RESEARCH   |     5 |
| JAMES  | SALES      |     6 |
| MILLER | ACCOUNTING |     3 |
+--------+------------+-------+
4 rows in set (0.00 sec)




20、列出最低薪金大于1500的各种工作及从事此工作的全部雇员人数.

select 
    job , count(*)
from 
    emp
group by 
    job
having 
    min(sal) > 1500;


+-----------+--------------+
| job       | count(empno) |
+-----------+--------------+
| SALESMAN  |            1 |
| MANAGER   |            3 |
| ANALYST   |            2 |
| PRESIDENT |            1 |
+-----------+--------------+
4 rows in set (0.01 sec)




21、列出在部门"SALES"<销售部>工作的员工的姓名,假定不知道销售部的部门编号.

select 
    emp.ename 员工姓名
from 
    emp 
join
    dept 
on
    emp.deptno = dept.deptno and dept.dname = 'sales';


+--------------+
| 员工姓名     |
+--------------+
| ALLEN        |
| WARD         |
| MARTIN       |
| BLAKE        |
| TURNER       |
| JAMES        |
+--------------+
6 rows in set (0.01 sec)



22、列出薪金高于公司平均薪金的所有员工,所在部门,上级领导,雇员的工资等级.



select 
    e_2.* , d.dname 所在部门,e_3.ename  上级领导 , s.grade 工资等级 
from 
    emp e_2
left join 
    dept d
on  
    e_2.deptno = d.deptno
left join
    emp e_3
on
    e_2.mgr = e_3.empno
left join 
    salgrade s
on
    e_2.sal between s.losal and hisal
where 
    e_2.sal > (select 
                    avg(e_1.sal) avg_sal
                from 
                    emp e_1
              );


+-------+-------+-----------+------+------------+---------+------+--------+--------------+--------------+--------------+
| EMPNO | ENAME | JOB       | MGR  | HIREDATE   | SAL     | COMM | DEPTNO | 所在部门     | 上级领导     | 工资等级     |
+-------+-------+-----------+------+------------+---------+------+--------+--------------+--------------+--------------+
|  7566 | JONES | MANAGER   | 7839 | 1981-04-02 | 2975.00 | NULL |     20 | RESEARCH     | KING         |            4 |
|  7698 | BLAKE | MANAGER   | 7839 | 1981-05-01 | 2850.00 | NULL |     30 | SALES        | KING         |            4 |
|  7782 | CLARK | MANAGER   | 7839 | 1981-06-09 | 2450.00 | NULL |     10 | ACCOUNTING   | KING         |            4 |
|  7788 | SCOTT | ANALYST   | 7566 | 1987-04-19 | 3000.00 | NULL |     20 | RESEARCH     | JONES        |            4 |
|  7902 | FORD  | ANALYST   | 7566 | 1981-12-03 | 3000.00 | NULL |     20 | RESEARCH     | JONES        |            4 |
|  7839 | KING  | PRESIDENT | NULL | 1981-11-17 | 5000.00 | NULL |     10 | ACCOUNTING   | NULL         |            5 |
+-------+-------+-----------+------+------------+---------+------+--------+--------------+--------------+--------------+




23、列出与"SCOTT"从事相同工作的所有员工及部门名称.

select 
    emp.ename, emp.job ,  dept.dname
from 
    emp 
left join 
    dept
on
    emp.deptno = dept.deptno
where 
    emp.job = (select e.job from emp e where e.ename = 'scott');



+-------+---------+----------+
| ename | job     | dname    |
+-------+---------+----------+
| SCOTT | ANALYST | RESEARCH |
| FORD  | ANALYST | RESEARCH |
+-------+---------+----------+
2 rows in set (0.00 sec)



24、列出薪金等于部门30中员工的薪金的其他员工的姓名和薪金.
看不懂




25、列出薪金高于在部门30工作的所有员工的薪金的员工姓名和薪金.部门名称.


select
    e1.ename,  e1.sal , d.dname 
from 
    emp e1
left join 
    dept d
on
    e1.deptno = d.deptno
where
    e1.sal > (select 
    max(sal) max_sal
from 
    emp e 
where
    deptno = 30);


+-------+---------+------------+
| ename | sal     | dname      |
+-------+---------+------------+
| JONES | 2975.00 | RESEARCH   |
| SCOTT | 3000.00 | RESEARCH   |
| KING  | 5000.00 | ACCOUNTING |
| FORD  | 3000.00 | RESEARCH   |
+-------+---------+------------+
4 rows in set (0.00 sec)



26、列出在每个部门工作的员工数量,平均工资和平均服务期限     不会

select 
    e.deptno , count(e.ename) , avg(e.sal) , avg(select datediff(e.HIREDATE, now()))
from
    emp e
group by
    e.deptno
having
    to_days(now());


+--------+-------------+---------------+
| deptno | avg(sal)    | avg(HIREDATE) |
+--------+-------------+---------------+
|     20 | 2175.000000 | 19832752.8000 |
|     30 | 1566.666667 | 19810663.6667 |
|     10 | 2916.666667 | 19813949.6667 |
+--------+-------------+---------------+
3 rows in set (0.00 sec)



27、列出所有员工的姓名、部门名称和工资。

select 
    e.ename 员工姓名 , d.dname 部门名称 , e.sal 工资
from
    emp e
left join 
    dept d
on
    e.deptno = d.deptno;


+--------------+--------------+---------+
| 员工姓名     | 部门名称        | 工资     |
+--------------+--------------+---------+
| SMITH        | RESEARCH     |  800.00 |
| ALLEN        | SALES        | 1600.00 |
| WARD         | SALES        | 1250.00 |
| JONES        | RESEARCH     | 2975.00 |
| MARTIN       | SALES        | 1250.00 |
| BLAKE        | SALES        | 2850.00 |
| CLARK        | ACCOUNTING   | 2450.00 |
| SCOTT        | RESEARCH     | 3000.00 |
| KING         | ACCOUNTING   | 5000.00 |
| TURNER       | SALES        | 1500.00 |
| ADAMS        | RESEARCH     | 1100.00 |
| JAMES        | SALES        |  950.00 |
| FORD         | RESEARCH     | 3000.00 |
| MILLER       | ACCOUNTING   | 1300.00 |
+--------------+--------------+---------+
14 rows in set (0.01 sec)



28、列出所有部门的详细信息和人数
select 
    d.*, count(e.ename) 
from 
    dept d
left join 
    emp e
on
    d.deptno = e.deptno
group by    
    d.deptno


+--------+------------+----------+----------------+
| DEPTNO | DNAME      | LOC      | count(e.ename) |
+--------+------------+----------+----------------+
|     20 | RESEARCH   | DALLAS   |              5 |
|     30 | SALES      | CHICAGO  |              6 |
|     10 | ACCOUNTING | NEW YORK |              3 |
|     40 | OPERATIONS | BOSTON   |              0 |
+--------+------------+----------+----------------+




29、列出各种工作的最低工资及从事此工作的雇员姓名

select 
    em.*
from 
    emp em
join 
    (
        select
            e.job e_job,  min(e.sal) min_sal
        from 
            emp e 
        group by 
            e.job
    ) t
on
    em.job = t.e_job and em.sal = t.min_sal

+-------+--------+-----------+------+------------+---------+---------+--------+
| EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL     | COMM    | DEPTNO |
+-------+--------+-----------+------+------------+---------+---------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450.00 |    NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1987-04-19 | 3000.00 |    NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000.00 |    NULL |     10 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000.00 |    NULL |     20 |
+-------+--------+-----------+------+------------+---------+---------+--------+
7 rows in set (0.00 sec)



30、列出各个部门的MANAGER(领导)的最低薪金


select 
    deptno , mgr 
from 
    emp
group by 
    deptno , mgr

select 
    t.deptno , min(e.sal)
from 
    emp e
right join
    (
        select 
            deptno , mgr 
        from 
            emp
        group by 
            deptno , mgr
    ) t
on
    e.empno = t.mgr 
group by
    t.deptno 


    +--------+------------+
    | deptno | min(e.sal) |
    +--------+------------+
    |     20 |    2975.00 |
    |     30 |    2850.00 |
    |     10 |    2450.00 |
    +--------+------------+
    3 rows in set (0.00 sec)



31、列出所有员工的年工资,按年薪从低到高排序

select 
    t.*
from 
    emp e
left join 
    (
    select 
        empno , ename ,  sal * 12 allsal
    from 
        emp
    ) t
on
    e.empno = t.empno
order by 
    t.allsal 
    

+-------+--------+----------+
| empno | ename  | allsal   |
+-------+--------+----------+
|  7369 | SMITH  |  9600.00 |
|  7900 | JAMES  | 11400.00 |
|  7876 | ADAMS  | 13200.00 |
|  7521 | WARD   | 15000.00 |
|  7654 | MARTIN | 15000.00 |
|  7934 | MILLER | 15600.00 |
|  7844 | TURNER | 18000.00 |
|  7499 | ALLEN  | 19200.00 |
|  7782 | CLARK  | 29400.00 |
|  7698 | BLAKE  | 34200.00 |
|  7566 | JONES  | 35700.00 |
|  7788 | SCOTT  | 36000.00 |
|  7902 | FORD   | 36000.00 |
|  7839 | KING   | 60000.00 |
+-------+--------+----------+


32、求出员工领导的薪水超过3000的员工名称与领导名称

select 
    e1.ename 员工名称  , e2.ename 领导名称 
from 
    emp e1 
left join
    emp e2
on
    e1.mgr = e2.empno
where
    e2.sal > 3000;


+--------------+--------------+
| 员工名称     | 领导名称     |
+--------------+--------------+
| JONES        | KING         |
| BLAKE        | KING         |
| CLARK        | KING         |
+--------------+--------------+
3 rows in set (0.00 sec)




33、求出部门名称中,带'S'字符的部门员工的工资合计、部门人数


select 
    e.deptno , sum(e.sal) , count(e.empno)
from 
    emp e
right join
    (
        select 
            deptno
        from 
            dept
        where
            dname like '%s%'
    ) t
on
    t.deptno = e.deptno
group by
    e.deptno 



+--------+------------+----------------+
| deptno | sum(e.sal) | count(e.empno) |
+--------+------------+----------------+
|     20 |   10875.00 |              5 |
|     30 |    9400.00 |              6 |
|   NULL |       NULL |              0 |
+--------+------------+----------------+
3 rows in set (0.00 sec)



34、给任职日期超过30年的员工加薪10%.


