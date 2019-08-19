import os, shutil, csv , glob, time, sys, ftplib


def copy_files(src,dest):
    """"This method will copy all files"""
    src_files = os.listdir(src)
    # print(src_files) exit()

    for file_name in src_files:
        full_file_name = os.path.join(src, file_name)
        if (os.path.isfile(full_file_name)):
            shutil.copy(full_file_name, dest)


def copy_files_by_pattern(src,dest,pattern,new_file_name):
    """This method will copy files by pattern"""
    print(src)
    print(dest)
    print(pattern)

    """Now copy files by pattern"""
    if new_file_name =='':
        for filename in glob.glob(src+pattern+'*'): #matches filenames that start with pattern
            shutil.copy(filename,dest) # keep same name
    else:
        for filename in glob.glob(src+pattern+'*'): #matches filenames that start with pattern
            new_file = dest+new_file_name
            shutil.copy(filename,new_file)  # with new name

def get_filepaths(directory):
    """
    This function will generate the file names in a directory
    tree by walking the tree either top-down or bottom-up. For each
    directory in the tree rooted at directory top (including top itself),
    it yields a 3-tuple (dirpath, dirnames, filenames).
    """
    file_paths = []  # List which will store all of the full filepaths.

    # Walk the tree.
    for root, directories, files in os.walk(directory):
        for filename in files:
            # Join the two strings in order to form the full filepath.
            filepath = os.path.join(root, filename)
            file_paths.append(filepath)  # Add it to the list.

    return file_paths  # Self-explanatory.



def parse_csv(file):
    print("\nProcessing " + file)

    meas_name = 'Tweet_Data_All.csv'
    # print(meas)
    # print(meas_name)

    ifile = open(file, "r")
    reader = csv.reader(ifile)
    # with open(file, 'rb') as f:
    #     reader = f.read()

    rownum = 0
    for row in reader:
        # print(row)
        # exit()
        if rownum > 1:  
            flag = 0
            # print(row[1])
            row[1] = row[1].replace(',',';')
            row.append('Bell')
            # print(row)
            cols = row
            # exit()
            write_csv(cols, flag, meas_name)
            #print(row)
            # if(rownum > 200):
            #     exit()
            

        rownum += 1

    ifile.close()

    #now lets remove the file from disk
    # delete_file(file)


def delete_file(filename):
    if os.path.exists(filename):
        try:
            print("Deleting " + filename)
            os.remove(filename)
        except OSError:
            print("Could not remove file")


def write_csv(columns,is_header,meas_name):
    measurement = proc + meas_name

    # print(columns)
    # print(measurement)
    # exit()

    if is_file_exist(measurement) == False and is_header == 1:
        f = open(measurement, 'w',newline='')
        with f:
            writer = csv.writer(f)
            writer.writerow(columns)
    elif is_file_exist(measurement) == True and is_header ==0:
        # print(columns)
        # print(measurement)
        # exit()
        with open(measurement, 'a',newline='') as f:
            writer = csv.writer(f)
            writer.writerow(columns)



def is_file_exist(filepath):
    # print(filepath)
    if not filepath:
        return False
    else:
        return os.path.isfile(filepath)



def upload_file_by_ftp(source_path, destination_directory, server, username, password,meas_file_name):
    session = ftplib.FTP(server, username, password)
    pwd = session.pwd()

    new_dest = session.cwd(destination_directory)

    measurement = source_path + meas_file_name
    # measurement = r'C:\Users\msaha\Desktop\Python\PROC\EDW\\Total_Data_Usage_By_Region.csv'
    print(measurement)
    # exit()

    file = open(measurement, 'rb')  # file to send
    session.storbinary('STOR '+meas_file_name, file)  # send the file

    file.close()  # close file and FTP
    session.quit()


def upload_multiple_files_by_ftp(source_path, destination_directory, server, username, password):
    session = ftplib.FTP(server, username, password)

    pwd = session.pwd()
    new_dest = session.cwd(destination_directory)
    print(new_dest)
    # exit()

    for file_name in os.listdir(source_path):
        if file_name.endswith(".csv"):
            file_to_put = os.path.join(source_path, file_name)

            file = open(file_to_put, 'rb')  # file to upload
            ftp_command = 'STOR '+file_name # destination file  name
            session.storbinary(ftp_command, file)  # upload the file

            file.close()  # close file and FTP

    session.quit()



if __name__ == "__main__":
    # date = time.strftime("%Y%m%d") #time.strftime("%Y-%m-%d %H:%M")
    # # date = '20181022'
    # src_path = 'S:\\Reports\\Technical\\'+date+'\\'
    # src_network = src_path

    # dest = r'C:\\Users\\msaha\\Desktop\\Office\\Wind Invoices\\MS_Course\\MRP\\MRP_Tweet_Final\\Parse_Data\\'
    # proc = r'C:\\Users\\msaha\\Desktop\\Office\\Wind Invoices\\MS_Course\\MRP\\MRP_Tweet_Final\\Parse_Data\\PROC\\'
    # header_path = r'C:\\Users\\msaha\\Desktop\\Office\\Wind Invoices\\MS_Course\\MRP\\MRP_Tweet_Final\\Parse_Data\\PROC\\header\\'

    dest = r'E:\\PROC\\MANUAL\\Parse_Data\\'
    proc = r'E:\\PROC\\MANUAL\\Parse_Data\\PROC\\'
    header_path = r'E:\\PROC\\MANUAL\\Parse_Data\\PROC\\header\\'

    # dest = r'/home/qosadmin/PROC/MANUAL/Parse_Data/'
    # proc = r'/home/qosadmin/PROC/MANUAL/Parse_Data/PROC/'
    # header_path = r'/home/qosadmin/PROC/MANUAL/Parse_Data/PROC/header/'

    # pattern_data_usage = 'Total Data Usage By Region & Date'
    # data_usage_raw_file_name = ''
    # data_usage_meas_file_name = 'Total_Data_Usage_By_Region.csv'

    # pattern_lte_msisdn = 'Distinct MSISDN for LTE subscribers'
    # msisdn_file_meas_name = 'Distinct_MSISDN_for_LTE_subscribers.csv'

    # ftp_local_one = '10.12.23.222'
    # ftp_local_two = '10.12.23.221'
    # ftp_local_three = '10.201.20.5'
    # ftp_local_user = 'qosftpuser'
    # ftp_local_pass = 'q0sftpuser'
    # ftp_local_dest = '/AUTOMATIC/EDW/MICROSTRATEGY/'

    # copy_files(src_network, dest) #copy all files n.b: Not needed for this parser

    # # Copy Data Usage file
    # copy_files_by_pattern(src_network, dest, pattern_data_usage,data_usage_raw_file_name) #copy one or more files by pattern

    # #Copy LTE MSISDN file
    # copy_files_by_pattern(src_network, proc, pattern_lte_msisdn,msisdn_file_meas_name)
    # # exit()

    # """Copy header files to proc"""
    copy_files(header_path, proc)

    """List the files to parse"""
    full_file_paths = get_filepaths(dest)
    # print(full_file_paths)
    # exit()

    """Start parsing"""
    for x in full_file_paths:
        # print('Parsing '+x+'\n')
        parse_csv(x)
        break

    # exit()

    # """upload files to DB server"""
    # upload_file_by_ftp(proc, ftp_local_dest, ftp_local_one, ftp_local_user, ftp_local_pass,data_usage_meas_file_name) #222
    # # upload_file_by_ftp(proc, ftp_local_dest, ftp_local_two, ftp_local_user, ftp_local_pass,msisdn_file_meas_name) #221
    # upload_file_by_ftp(proc, ftp_local_dest, ftp_local_three, ftp_local_user, ftp_local_pass,msisdn_file_meas_name) #5
    # # upload_multiple_files_by_ftp(proc, ftp_local_dest, ftp_local_one, ftp_local_user, ftp_local_pass)
