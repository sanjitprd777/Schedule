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
    }
}

const Show = {
    render : async () => {
        let req = Utils.parseRequestURL();
        let interview = await getShows(req.id);
        console.log(interview)
        let view =  `
          <section class="section">
            <div class="container">
            <div class="container-fluid">

              <div class="form-group">
                <strong>Title:</strong>
                 ${interview.title}
              </div>

              <div class="form-group">
                <strong>Interviewer email:</strong>
                 ${interview.interviewer_email}
              </div>

              <div class="form-group">
                <strong>Interviewee email:</strong>
                 ${interview.interviewee_email}
              </div>

              <div class="form-group">
                <strong>Start time:</strong>
                 ${interview.start_time}
              </div>
              
              <div class="form-group">
                <strong>End time:</strong>
                 ${interview.end_time}
              </div>

              <div class="form-group">
                <strong>Resume:</strong>
                <a onclick = "window.location.href='${interview.avatar_file_name}'">Resume</a>
              </div>
              <div class="form-group text-center">
              <a onclick = "window.location.href= '/#/interviews/${
                interview.id
              }/Edit'">Edit | </a>
              <a onclick = "window.location.href= '/#/interviews/${
                interview.id
              }/delete'">Delete | </a>
              <a onclick = "window.location.href= '/#/interviews'">Back</a>
              </div>
            </div>
            </div>
          </section>
        `
        return view
    },
    after_render: async () => {  }
}
