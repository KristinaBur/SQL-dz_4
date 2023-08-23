- Подсчитать общее количество лайков, которые получили пользователи младше 12 лет:

select count(l.id) "количество лайков"
from likes as l
join profiles as p on l.user_id = p.user_id
WHERE TIMESTAMPDIFF(YEAR, p.birthday, CURDATE()) < 12;


- Определить кто больше поставил лайков (всего): мужчины или женщины:

select case (gender)
    when 'm' then 'мужчин'
	when 'f' then 'женщин'
    end as 'кого больше', count(*) as 'лайков'
from profiles p
join likes l
where l.user_id = p.user_id group by gender limit 1;

- Вывести всех пользователей, которые не отправляли сообщения:

select concat(u.firstname, ' ', u.lastname) AS 'Пользователь'
from users as u
left join messages m on u.id = m.from_user_id
where m.from_user_id is null;

- Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех написал ему сообщений:

select u.firstname, u.lastname
from users u
join messages m
where m.from_user_id = u.id AND m.to_user_id = 7 
group by u.firstname, u.lastname
order by count(from_user_id) desc limit 1;

