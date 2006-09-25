[({$SNS_NAME})]({$commu_name})
({$nickname})>>
({$body})

({if $image_filename1})
画像：
[小]({t_img_url filename=$image_filename1 w=120 h=120 f=jpg})
[大]({t_img_url filename=$image_filename1 f=jpg})
({/if})
({if $image_filename2})
画像：
[小]({t_img_url filename=$image_filename2 w=120 h=120 f=jpg})
[大]({t_img_url filename=$image_filename2 f=jpg})
({/if})
({if $image_filename3})
画像：
[小]({t_img_url filename=$image_filename3 w=120 h=120 f=jpg})
[大]({t_img_url filename=$image_filename3 f=jpg})
({/if})