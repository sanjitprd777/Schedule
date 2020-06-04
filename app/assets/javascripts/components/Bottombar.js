const Bottombar = {
    render: async () => {
        let view = `
            <div id="footer_container">
                <footer class="footer">
                    <div class="content has-text-centered">
                        <p>
                            For any query, email at : sanjitpd777@gmail.com
                        </p>
                    </div>
                </footer>
            </div>
        `
        return view
    },
    after_render: async () => { }
};