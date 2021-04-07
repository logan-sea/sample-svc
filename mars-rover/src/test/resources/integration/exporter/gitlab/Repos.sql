select r.id                              as external_repo_id,
       r.created_at,
       r.last_activity_at                as updated_at,
       r.http_url_to_repo                as repo_url,
       r.name                            as display_name,
       CONVERT(r.description USING utf8) as description,
       r.default_branch,
       CAST(r.archived as UNSIGNED)      as is_archived,
       r.creator_id                      as external_repo_owner_id
       --  , r.recordModifiedDate as record_modified_dtm
from gitlab_projects r