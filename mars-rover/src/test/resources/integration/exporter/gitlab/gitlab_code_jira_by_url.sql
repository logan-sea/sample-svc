select event.id,
       mr.web_url,
       event.created_at,
       user.web_url      as 'author_id',
       event.action_name as 'current_state',
       event.recordModifiedDate,
       mr.title,
       mr.description,
       mr.source_branch
from gitlab_merge_requests mr
         JOIN gitlab_event event on event.target_iid = convert(mr.iid using utf8mb4) and
                                    event.project_id = convert(mr.project_id using utf8mb4)
         JOIN gitlab_users user on event.author_web_url = user.web_url
where lower(event.tenantName) like lower(?1)
and mr.web_url in (?2)