{{- if .PreviousStatus}}
    {{- if ne .PreviousStatus .CurrentStatus}}
        Обновился статус на **{{.CurrentStatus}}** (было *{{.PreviousStatus}}*)
    {{- end}}
{{- else}}
    Новый статус **{{.CurrentStatus}}**
{{- end}}
{{- if .CommentContent}}
    Новый комментарий от **{{.CommentAuthor}}**:
    ```{{.CommentContent}}```
{{- end}}