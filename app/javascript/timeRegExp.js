export const display = () => {
  const timeElements = document.getElementsByClassName('created_at');

  //投稿に対する表示時間修正
  const pattern1 = '+0900';
  
  //コメントに対する表示時間修正
  const pattern2 = 'T'; 
  const pattern3 = /\.\d{3}\+09:00/;

  const array = Array.from(timeElements);
  array.forEach(element => {
    element.innerHTML = element.innerHTML.replace(pattern1, '');
    element.innerHTML = element.innerHTML.replace(/-/g, '/');
    element.innerHTML = element.innerHTML.replace(pattern2, ' ');
    element.innerHTML = element.innerHTML.replace(pattern3, '');
  });
  
  
}

window.addEventListener('load', display);