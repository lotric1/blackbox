json.extract! bbox_content, :id, :text, :insertion_date, :completion_date, :due_date, :completed, :pinned, :pass_counter, :bbox_id, :created_at, :updated_at
json.url bbox_content_url(bbox_content, format: :json)
