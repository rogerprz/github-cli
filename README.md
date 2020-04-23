# Github CLI 

Github CLI provides a way to easily remove multiple repos and to output a list of all repositories. 
** USE AT OWN RISK ** 

### Built with
* Ruby
* Github Octokit
* CLI
* tty* ruby gems

# Getting Started

## What you will need 

* Create a PAT (Personal Access Token) within [Github>Settings>Developer Settings> PAT](https://github.com/settings/tokens) 
  * Check all the boxes when creating PAT
  * Copy and save your PAT on a notepad to be used for later.
* Github handle/username, i.e. [@rogerprz](https://github.com/rogerprz)


## Clone repo 

* Clone repo into your projects folder

## Running CLI 
 
 Once repo has been clone `cd` into it.
  * Run `ruby bin/run.rb token:<PAT> username:<username>`
   * You will need to replace `<PAT>` & `<username>` with your PAT and username.
   
**Note: CLI will not run if `token:` and `username:` are not present.**


# Connect/Thanks 
Feel free to connect or message me about any questions or additional features. 

<a href="https://twitter.com/realrogerprz"><img src="images/twitter_icon.png" width="40">@realrogerprz</a> 

# Disclaimer :warning:

THIS SOFTWARE/CLI IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS “AS IS” AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
