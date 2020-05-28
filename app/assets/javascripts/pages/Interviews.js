const getInterviews = async () => {
     const options = {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    };
    try {
        const response = await fetch(`http://localhost:3000/interviews`, options)
        const json = await response.json();
        return json
    } catch (err) {
        console.log('Error getting documents', err)
    }
}

const Interviews = {
    render : async () => {
        let interviews = await getInterviews()
        console.log(interviews)
        let view =  `
          <section class="section">
            <div class="contained">
            <div class="container-fluid">
            <style>
            table {
              font-family: arial, sans-serif;
              border-collapse: collapse;
              width: 100%;
            }

            td, th {
              border: 1px solid #dddddd;
              text-align: left;
              padding: 8px;
            }

            tr:nth-child(even) {
              background-color: #dddddd;
            }
            </style>

            <h1>Listing Interviews Events</h1>
              <table>
              <tr>
                <th>Subject</th>
                <th>Interviewer email</th>
                <th>Interviewee email</th>
                <th>Start time</th>
                <th>End time</th>
                <th>Attachment</th>
                <th>Change</th>
              </tr>


              ${interviews
                .map(
                  (interview) =>
                    `
                      <tr>
                        <td> ${interview.title} </td>
                        <td> ${interview.interviewer_email} </td>
                        <td> ${interview.interviewee_email} </td>
                        <td> ${interview.start_time} </td>
                        <td> ${interview.end_time} </td>
                        <td> <a onclick = "window.location.href='${interview.avatar_file_name}'">Resume</a></td>
                        <td> <a onclick = "window.location.href='/#/interviews/${interview.id}'">Show</a></td>
                      </tr>
                    `
                  )
                .join("\n") }
            </table>
            </div>
            </div>
          </section>
        `
        return view
    },
    after_render: async () => {  }
}

