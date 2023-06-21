import { display } from "./timeRegExp";

const buildHTML = (comments, postID) => {
  const commentsList = document.getElementById(`comments-list${postID}`)
  comments.forEach(comment => {
    const html = `
      <div class="comment-content">
        <div class="name">
          <p>名前：${comment.name}</p>
        </div>
        <div class="text">
          <p>コメント<br>
            ${comment.text}<br>
          </p>
        </div>
        <div class="destroy-comment">
          <form id="destroy-comment-form${comment.id}">
            <input type="password" name="password" class="comment-password-field" placeholder="パスワードを入力" id="password-field${comment.id}">
            <input type="submit" class="destroy-comment-btn" value="削除" id="destroy-comment-btn${comment.id}">
          </form>
        </div>
        <div class="created_at">
          <p>${comment.created_at}</p>
        </div>
      </div>`;
    commentsList.insertAdjacentHTML("beforeend", html);
  });
};

const getComments = () => {
  const btnArr = document.querySelectorAll('.comments-btn');
  btnArr.forEach(btn => {
    btn.addEventListener('click', (e) => {
      e.preventDefault();
      const id = btn.id.replace(/comments-btn/, "");
      const xhr = new XMLHttpRequest();
      xhr.open("GET", `/posts/${id}/comments`, true);
      xhr.responseType = "json"
      xhr.send();
      
      xhr.onload = () => {
        const comments = xhr.response.comments;
        const postID = xhr.response.post.id
        buildHTML(comments, postID);
        display();
        
      };
    });
  });
}

window.addEventListener('load', getComments);