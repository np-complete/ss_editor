change_faces = (url, character_id)->
    $.ajax url + '/change_faces', {
        data: {
            character_id: character_id
        },
        success: (res) ->
            faces = $("#dialog_face_id")
            faces.html("")
            for face in res
                faces.append $("<option>").attr("value", face.id).html(face.name)
    }
init_character_select = (url) ->
    $("#dialog_character_id").change ->
        change_faces url, $(this).val()

init_dialog_sortable = (url) ->
    $("#dialogs").sortable {
        items: '> div',
        update: ->
            console.log $("#dialogs").sortable('serialize')
            $.ajax url + '/update_orders', {
                type: 'put',
                data: $('#dialogs').sortable('serialize'),
                beforeSend: (xhr) ->
                    xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
            }
    }
$(document).ready ->
    init_character_select this.location.pathname
    init_dialog_sortable this.location.pathname
