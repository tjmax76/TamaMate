const buildList = (comments) => {
  comments.forEach(comment => {
    const html = `
      <div class="comment-content>
        <div class="destroy-comment">
          <form id="destroy-comment-form${comment.id}">
            <input type="password" name="password" class="comment-password-field" placeholder="パスワードを入力" id="password-field<%= post.id %>">
            <input type="submit" class="destroy-comment-btn" value="削除" id="destroy-comment-btn${comment.id}">
          </form>
        </div>
      </div>`
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
        buildList(comments);
        
      };
    });
  });
}

window.addEventListener('load', getComments);