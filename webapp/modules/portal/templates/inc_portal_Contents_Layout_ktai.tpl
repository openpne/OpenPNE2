       ({if $data.kind == 'FREE1' || $data.kind == 'FREE2' || $data.kind == 'FREE3' || $data.kind == 'FREE4'})
            ({if $data.contents})
                ({$data.contents.html|smarty:nodefaults})<br>
            ({/if})
       ({/if})

