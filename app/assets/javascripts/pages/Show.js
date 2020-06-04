const getShows = async (id) => {
     const options = {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    };
    try {
        const response = await fetch(`http://localhost:3000/interviews/` + id, options)
        const json = await response.json();
        return json
    } catch (err) {
        console.log('Error getting documents', err)
        return null
    }
}

function myFunction(id) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("demo").innerHTML = "Interview successfully deleted.";
    }
  };
  xhttp.open("DELETE", "/interviews/" + id, true);
  xhttp.send();

  window.location.href= '/#/interviews/'

}
const Show = {
    render : async () => {
        let req = Utils.parseRequestURL();
        let interview = await getShows(req.id);
      if(interview != null){
        let view =  `
          <section class="section">
            <div class="container">
            <div class="container-fluid">

              <div class="form-group">
                <label>Title:</label>
                <labelshow>${interview.title}</labelshow>
              </div>

              <div class="form-group">
                <label>Interviewer email:</label>
                <labelshow>${interview.interviewer_email}</labelshow>
              </div>

              <div class="form-group">
                <label>Interviewee email:</label>
                <labelshow>${interview.interviewee_email}</labelshow>
              </div>

              <div class="form-group">
                <label>Start time:</label>
                <labelshow>${interview.start_time}</labelshow>
              </div>
              
              <div class="form-group">
                <label>End time:</label>
                <labelshow>${interview.end_time}</labelshow>
              </div>

              <div class="form-group">
                <label>Resume:</label>
                <labelshow><a onclick = "window.location.href='${interview.avatar_file_name}'">Resume</a></labelshow>
              </div>
              <div class="form-group text-center">
              <a onclick = "window.location.href= '/#/interviews/${interview.id}/Edit'">Edit | </a>
              <a onclick = "myFunction(${req.id})">Delete | </a>
              <a onclick = "window.location.href= '/#/interviews'">Back</a>
              </div>
            </div>
            </div>
          </section>
        `
        return view
      }
    },
    after_render: async () => {  }
}