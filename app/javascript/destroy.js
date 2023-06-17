const destroy = () => {
  const btnArr = document.querySelectorAll('.destroy-btn');
  btnArr.forEach(btn => {
    btn.addEventListener('click', (e) => {
      e.preventDefault();
      const postID = btn.id.replace(/destroy-btn/, "");
      const form = document.getElementById(`destroy-form${postID}`);
      const formData = new FormData(form);
      const xhr = new XMLHttpRequest();
      const token = document.querySelector('meta[name="csrf-token"]').content;

      
      xhr.open("DELETE", `/posts/${postID}`, true);
      xhr.responseType = "json";
      xhr.setRequestHeader("X-CSRF-Token", token);
      xhr.send(formData);

      xhr.onload = () => {
        if(xhr.response.text == ""){
          window.location.href = '/';
        }else{
          alert(xhr.response.text)
        }
      };
    });
  });
};

window.addEventListener('load', destroy)