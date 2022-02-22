--SQL HomeWork 3. Joins

select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;
select * from roles_employee;

-- 1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������. +

select employees.employee_name, salary.monthly_salary from employee_salary 
join employees on employee_salary.employee_id = employees.id
join salary on employee_salary.salary_id = salary.id;

--2. ������� ���� ���������� � ������� �� ������ 2000. +

select employees.employee_name, salary.monthly_salary  from employee_salary es 
join employees on es.employee_id = employees.id
join salary on es.salary_id = salary.id
where monthly_salary < 2000;

-- 3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. +
-- (�� ����, �� �� ������� ��� � ��������.)

select employee_id, employee_name, monthly_salary from employees 
right join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
where employee_name is null;

 -- 4. ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. 
 --(�� ����, �� �� ������� ��� � ��������.)

select es.employee_id, employees.employee_name, salary.monthly_salary 
from employee_salary es 
left join employees on es.employee_id = employees.id
join salary on es.salary_id = salary.id
where monthly_salary < 2000 and employee_name is null;

-- 5. ����� ���� ���������� ���� �� ��������� ��. +

select employee_name, salary_id from employee_salary es
right join employees e on es.employee_id = e.id
where salary_id  is null;

--6. ������� ���� ���������� � ���������� �� ���������.+

select employees.employee_name, roles.role_name from roles_employee re 
join employees on re.employee_id = employees.id
join roles on re.role_id = roles.id;

--7. ������� ����� � ��������� ������ Java �������������.+

select employees.employee_name, roles.role_name from roles_employee re 
join employees on re.employee_id = employees.id
join roles on re.role_id = roles.id
where role_name like '%Java developer';

-- 8. ������� ����� � ��������� ������ Python �������������.+

select employees.employee_name, roles.role_name from roles_employee re 
join employees on re.employee_id = employees.id
join roles on re.role_id = roles.id
where role_name like '%Python developer';

--9. ������� ����� � ��������� ���� QA ���������.+

select employees.employee_name, roles.role_name from roles_employee re 
join employees on re.employee_id = employees.id
join roles on re.role_id = roles.id
where role_name like '% QA eng%';

-- 10. ������� ����� � ��������� ������ QA ���������.+

select employees.employee_name, roles.role_name from roles_employee re 
join employees on re.employee_id = employees.id 
join roles on re.role_id = roles.id
where role_name like '%Manual QA eng%';

--11. ������� ����� � ��������� ��������������� QA. +

select employees.employee_name, roles.role_name from roles_employee re
join employees  on re.employee_id = employees.id
join roles on re.role_id = roles.id 
where role_name like '%Automation QA%';

--12. ������� ����� � �������� Junior ������������. +

select employee_name, role_name, monthly_salary from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
where role_name like 'Junior%';

--13. ������� ����� � �������� Middle ������������. +

select employee_name, role_name, monthly_salary from employees e 
join employee_salary es on e.id = es.employee_id
join salary on salary.id = es.salary_id
join roles_employee on e.id = roles_employee.role_id
join roles on roles.id = roles_employee.role_id
where role_name like 'Middle%';

 --14. ������� ����� � �������� Senior ������������. +

select employee_name, role_name, monthly_salary from employees 
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee  on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
where role_name like 'Senior%';

 --15. ������� �������� Java �������������.+

select  monthly_salary from employees 
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee  on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
where role_name like '%Java developer';

-- 16. ������� �������� Python �������������. +

select monthly_salary from employees 
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee  on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
where role_name like '%Python developer';

 --17. ������� ����� � �������� Junior Python �������������.+

select employee_name, monthly_salary, role_name from employees 
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee  on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
where role_name like 'Junior Python developer';

 --18. ������� ����� � �������� Middle JS �������������. 

select employee_name, monthly_salary, role_name from employees 
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee  on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
where role_name like 'Middle JavaScript developer';

 --19. ������� ����� � �������� Senior Java �������������.

select employee_name, monthly_salary, role_name from employees 
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee  on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
where role_name like 'Senior Java developer';

 --20. ������� �������� Junior QA ���������. +

select  monthly_salary, role_name from employees 
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee  on employees.id = roles_employee.employee_id
join roles on roles.id = roles_employee.role_id
where role_name like 'Junior%QA eng%';

 --21. ������� ������� �������� ���� Junior ������������. +

select avg(monthly_salary) from employees
join employee_salary
on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on employees.id=roles_employee.employee_id
join roles on roles.id=roles_employee.role_id
where role_name like 'Junior%';

--22. ������� ����� ������� JS �������������. +

select sum(monthly_salary) from employees 
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id
where role_name like '%JavaScript developer';

-- 23. ������� ����������� �� QA ���������. +

select min(monthly_salary) from employees 
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where role_name like '%QA eng%';

--24. ������� ������������ �� QA ���������. +

select max(monthly_salary) from employees 
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.id = employees.id
join roles on roles.id = roles_employee.role_id
where role_name like '%QA eng%';

--25. ������� ���������� QA ���������. +

select count (role_name) as  count_QA_eng from roles_employee re 
join employees on re.employee_id = employees.id
join roles on re.role_id = roles.id
where role_name like '% QA eng%';

--26. ������� ���������� Middle ������������. +

select count(role_name) as count_Middle from roles_employee 
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id
where role_name like '%Middle%';

--27. ������� ���������� �������������. +

select count (role_name)  as count_developer from roles_employee 
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id
where role_name like '%developer%';

-- 28. ������� ���� (�����) �������� �������������.+

select sum(monthly_salary) from employees
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where role_name like '%developer';

--29. ������� �����, ��������� � �� ���� ������������ �� �����������.+

select employee_name, role_name, monthly_salary from employees 
join employee_salary  on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee re on re.employee_id = employees.id
join roles on roles.id = re.role_id
order by monthly_salary;

--30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300

select employee_name, role_name, monthly_salary from employees 
join employee_salary  on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee re on re.employee_id = employees.id
join roles on roles.id = re.role_id
where monthly_salary between 1700 and 2300
order by monthly_salary;
order by monthly_salary;

--31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300. +

select employee_name, role_name, monthly_salary from employees 
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where monthly_salary <2300
order by monthly_salary;
--32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000. +

select employee_name, role_name, monthly_salary from employees 
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on roles_employee.employee_id = employees.id
join roles on roles.id = roles_employee.role_id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary;