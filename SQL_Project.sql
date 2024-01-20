use ig_clone;

-- Query 1:

select * from users;
select * from users 
order by created_at desc
limit 5;

-- Query 2:

select * from users;
select dayname(created_at), count(*) as users_day
from users
group by dayname(created_at)
order by users_day desc
limit 1;

-- Query 3:

select * from photos;
select *
from users as u
left join 
photos as p
on u.id = p.user_id
where p.user_id is null;

-- Query 4:

select * from likes;
SELECT p.user_id, photo_id, COUNT(photo_id)
FROM likes AS l
JOIN
photos AS p 
ON l.photo_id = p.id
GROUP BY photo_id
ORDER BY COUNT(photo_id) DESC
LIMIT 1;

-- Query 5:

select count(distinct p.id) / count(distinct u.id)
from users as u, photos as p;

-- Query 6:

select p.user_id, count(*) as photo_count
from photos as p
group by p.user_id
order by photo_count desc;

-- Query 7:

select count(distinct u.id)
from users as u
left join 
photos as p
on u.id = p.user_id
where p.id is not null;

-- Query 8:

select * from tags;
select * from photo_tags;
select tags.tag_name, p.photo_id
from tags
join photo_tags as p
on tags.id = p.tag_id;

-- Query 9:

select * from tags;
select tags.tag_name, count(*) as tag_count
from tags
join photo_tags as p
on tags.id = p.tag_id
group by tags.tag_name
order by tag_count desc
limit 5;

-- Query 10:

select * from likes;

SELECT id, COUNT(*) AS num_likes
FROM
users
JOIN
likes ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING num_likes = (SELECT 
COUNT(*)
FROM
photos);

-- Query 11:

select * from comments;
select u.id
from users as u
left join comments as c
on u.id = c.user_id
where c.id is null;