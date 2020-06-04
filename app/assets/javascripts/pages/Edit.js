let update = async (interview) => {
  let data = {
    title: interview.title,
    interviewer_email: interview.interviewer_email,
    interviewee_email: interview.interviewee_email,
    start_time: interview.start_time,
    end_time: interview.end_time,
    avatar: interview.avatar
  };
  let options = {
    method: "PUT",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  };
  try {
    let res = await fetch(`http://localhost:3000/interviews/` + interview.id, options);
    alert("Interview Updated Successfully");
    location.hash = "/interviews";
  } catch (err) {
    console.log(err);
  }
};

let Edit = {
  render: async () => {
    let req = Utils.parseRequestURL();
    let interview = await getShows(req.id);
    let view = `
      <section>
        <div class="container">
        <div class="container-fluid">
        <center><h1>Edit the Interview Event </h1></center>
        <div class="form-group">
          <label>Title:</label>
          <input type="text" id="tit" value=${interview.title}></input>
        </div>
        <div class="form-group">
          <label>Interviewer Email:</label>
          <input type="email" id="r-email" value=${interview.interviewer_email}></input>
        </div>
        <div class="form-group">
          <label>Interviewee Email:</label>
          <input type="email" id="e-email" value=${interview.interviewee_email}></input>
        </div>
        <div class="form-group">
          <label>Start Time:</label>
          <input type="datetime-local" id="stime" value="${interview.start_time}"></input>
        </div>
        <div class="form-group">
          <label>End Time:</label>
          <input type="datetime-local" id="etime" value=${interview.end_time}></input>
        </div>
        <div class="form-group">
          <label>Resume:</label>
          <input type="file" id="ava" accept="application/pdf"></input>
        </div>
        <div class="form-group text-center" >
          <button id="sub">Update Event</button>
        </div>
        <div class="form-group text-center">
        <a onclick = "window.location.href= '/#/interviews';">Back</a>
        </div>
        </div>
        </div>
      </section>
    `;
    return view;
  },
  after_render: async () => {
    document.getElementById("sub").addEventListener("click", () => {
        let req = Utils.parseRequestURL();
        let title = document.getElementById("tit");
        let interviewer_email = document.getElementById("r-email");
        let interviewee_email = document.getElementById("e-email");
        let start_time = document.getElementById("stime");
        let end_time = document.getElementById("etime");
        let avatar = document.getElementById("ava");
        let interview = {
            id: req.id,
            title: title.value,
            interviewer_email: interviewer_email.value,
            interviewee_email: interviewee_email.value,
            start_time: start_time.value,
            end_time: end_time.value,
            avatar: avatar.value
        };
        update(interview);
    });
  },
};