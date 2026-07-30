import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure CrystallographyPackage where
  unitCell : Type u
  bravaisLattice : Type v
  spaceGroupSymmetries : Prop
  latticeParameters : Prop
  xrayDiffractionPattern : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) where
  unitCellClosed : C.unitCell = C.unitCell
  bravaisLatticeClosed : C.bravaisLattice = C.bravaisLattice
  spaceGroupSymmetriesClosed : C.spaceGroupSymmetries
  latticeParametersClosed : C.latticeParameters
  xrayDiffractionPatternClosed : C.xrayDiffractionPattern

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.spaceGroupSymmetries ∧ C.latticeParameters ∧ C.xrayDiffractionPattern

theorem crystallography_closed_from_evidence (C : CrystallographyPackage) (E : CrystallographyEvidence C) :
    CrystallographyClosed C := by
  exact And.intro E.spaceGroupSymmetriesClosed (And.intro E.latticeParametersClosed E.xrayDiffractionPatternClosed)

end MaterialsBiomaterialsTheoremCanonicalLaneLean
end HautevilleHouse