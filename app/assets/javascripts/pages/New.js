let create = async (interview) => {
  let data = {
    title: interview.title,
    interviewer_email: interview.interviewer_email,
    interviewee_email: interview.interviewee_email,
    start_time: interview.start_time,
    end_time: interview.end_time,
    avatar: interview.avatar
  };

  console.log(data);
  
  const options = {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  };
  try {
    const res = await fetch(`http://localhost:3000/interviews`, options);
    alert("Interview Created Successfully");
    location.hash = "/interviews";
  } catch (err) {
    console.log(err);
  }
};

const New = {
  render: async () => {
    let view = `
      <section>
      <div class="container">
      <div class="container-fluid">
        <center><h1>Create an Interview Event </h1></center>
          <div class="form-group" id="myForm">
            <label>Title:</label>
            <input type="text" id="tit"></input>
          </div>
          <div class="form-group">
            <label>Interviewer Email:</label>
            <input type="email" id="r-email"></input>
          </div>
          <div class="form-group">
            <label>Interviewee Email:</label>
            <input type="email" id="e-email"></input>
          </div>
          <div class="form-group">
            <label>Start Time:</label>
            <input type="datetime-local" id="stime"></input>
          </div>
          <div class="form-group">
            <label>End Time:</label>
            <input type="datetime-local" id="etime"></input>
          </div>
          <div class="form-group">
            <label>Resume:</label>
            <input type="file" name="ava" id="ava" accept="application/pdf"></input>
          </div>
          <div class="form-group text-center">
          <div class="form-group text-center" >
            <button type="submit" id="sub">Create Event</button>
          </div>
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

      let title = document.getElementById("tit");
      let interviewer_email = document.getElementById("r-email");
      let interviewee_email = document.getElementById("e-email");
      let start_time = document.getElementById("stime");
      let end_time = document.getElementById("etime");
      let avatar = document.getElementById("ava");
      
      console.log(typeof(avatar));
      console.log(document.getElementById("ava").files[0]);

      let interview = {
        title: title.value,
        interviewer_email: interviewer_email.value,
        interviewee_email: interviewee_email.value,
        start_time: start_time.value,
        end_time: end_time.value,
        avatar: avatar.files[0]
      };
      create(interview);
    });
  },
};
