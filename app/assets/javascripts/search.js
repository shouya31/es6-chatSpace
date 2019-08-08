window.addEventListener("load", function () {
    const input = document.querySelector("#user-search-field")
    const result = document.querySelector("#user-search-result")

    let word = input.value
    let users = document.querySelector("#group_user_name_info").value
    let group_users = JSON.parse(users);
    let ids = document.querySelector("#group_user_id_info").value
    let user_ids = JSON.parse(ids);

    function buildHtml(user_name, user_id) {
        let html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${user_name}</p>
                  <div class="user-search-add chat-group-user__btn chat-group-user__btn--add" value=${user_id}>追加</div>
                </div>`
        result.insertAdjacentHTML("beforeend", html)
    }

    function buildAddUserHTML(name, user_id) {
        let html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
                  <input name='group[user_ids][]' type='hidden' value=${user_id}>
                  <p class='chat-group-user__name'>${name}</p>
                  <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
                </div>`
        document.querySelector("#chat-group-user-22").insertAdjacentHTML("afterend", html)
    }

    function DeleteUser() {
        const delete_btn = document.querySelectorAll(".js-chat-member")
        for (let delete_user of delete_btn) {
            delete_user.addEventListener('click', function () {
                let deleted_user = delete_user.querySelector("p").textContent
                delete_user.remove()
                group_users.push(deleted_user);
            })
        }
    }

    function AddUser() {
        const btn = document.querySelectorAll(".chat-group-user")
        for (let user of btn) {
            user.addEventListener('click', function () {
                let user_name = user.querySelector("p").textContent
                let user_id = user.querySelector("div").getAttribute("value")
                user.remove()
                group_users.shift(user_name)
                buildAddUserHTML(user_name, user_id)
                DeleteUser()
            });
        }
        ;
    }

    function wordKeyup() {
        if (group_users.length !== 0) {
            result.innerHTML = "";
            group_users.forEach(function (user, user_ids) {
                buildHtml(user, user_ids + 1)
            })
            AddUser()
        }
    }

    input.addEventListener('keyup', wordKeyup);

});
