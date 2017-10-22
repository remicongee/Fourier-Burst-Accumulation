function ima = ima2mat(name)

% ima2mat is used to read images in the ENST-IMA format.
%
%         Usage: ima = ima2mat('toto');
%
%         See also: mat2ima, dim2mat, tiv2mat

% (c) 1996 by B. Verdonck & L. Aurdal, ENST-IMA.
% (m) 1998 by M. Roux, ENST-TSI

% Open, read and close dimension file.

if nargin == 0
  error('You have to specify a filename (between quotes: ''name'') !');
end;

% Open, read and close dimension file.

nameLength = length(name);
baseName = name;
if (nameLength > 4)
  if sum(name(nameLength-3:nameLength) == '.dim') == 4 | ...
	sum(name(nameLength-3:nameLength) == '.ima') == 4
    baseName = name(1:nameLength-4);
  end;
end;
fileName = [baseName '.dim'];

dimfid = fopen(fileName, 'r');
if ~(dimfid > 2)
  error(['Failed to open the dimension file: ' fileName]);
end;

disp(['Read from file: ' fileName]);
[dim, nrRead] = fscanf(dimfid,'%d', 2);

if nrRead == 2 & dim(1)>0 & dim(2)>0
  % old IMA type
  dim = dim';
  disp(['     IMA file type ; values in [0, 255] ; size (' ...
	  int2str(dim(1)) ', ' int2str(dim(2)) ')']); 
  type = 'uchar';
else 
   error(['Invalid dimension file: ' fileName]);
end;
 
dimstat = fclose(dimfid);
if ~(dimstat == 0)
  error('Failed to close the dimension file')
end;

% Open, read and close image file.

fileName = [baseName '.ima'];
imafid = fopen(fileName, 'r');
if ~(imafid > 2)
  error(['Failed to open the file: ' fileName]);
end;

disp(['Read from file: ' fileName]);
[ima, nrRead] = fread(imafid,[dim(1), dim(2)],type);
if nrRead~=dim(1)*dim(2)
  error(['Image data file size does not match dimension '...
	  'specifications.']);
end;

imastat = fclose(imafid);
if ~(imastat == 0)
  error(['Failed to close the file:' fileName]);
end;

ima = ima';

disp('Image read !');

%end. 		Modif mroux 20-08-1998 (mise en commentaire de la ligne).
